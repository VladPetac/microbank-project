# ===========================================================
# MicroBank Account Service - Multi-stage Dockerfile
# ===========================================================

# --- Stage 1: BUILD ---
# Use a JDK image (has Maven + Java compiler) to build the application
FROM maven:3.9-eclipse-temurin-21 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven config first (for better layer caching)
# If pom.xml hasn't changed, Docker reuses this cached layer
COPY pom.xml

# Download dependencies (cached if pom.xml unchanged)
RUN mvn dependency:go-offline -B

# Now copy the source code
COPY src ./src

# Build the JAR file (skip tests for faster builds)
RUN mvn package -DskipTests - B

# --- Stage 2: RUN ---
# Use a minimal JRE image (no compiler, no Maven - much smaller)
FROM eclipse-temurin:21-jre-alpine

# Security: don't run as root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory
WORKDIR /app

# Copy ONLY the built JAR from the builder stage (not the whole build environment)
COPY --from=builder /app/target/*.jar app.jar

# Switch to non-root user
USER appuser

# Document the port
EXPOSE 8081

# Health check - Docker will periodically check if the app is alive
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8081/actuator/health || exit 1

# Start the application
# Java apps typically need memory settings in containers
CMD ["java", "-Xmx512m", "-Xms256m", "-jar", "app.jar"]
