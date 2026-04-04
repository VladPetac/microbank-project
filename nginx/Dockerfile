# MicroBank Nginx - API Gateway / Reverse Proxy
FROM nginx:1.27-alpine

RUN apk update && apk upgrade --no-cache

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom config
COPY nginx.conf /etc/nginx/nginx.conf

# Non-root user (nginx image supports this)
# Note: port 80 requires root, so we use 8080
RUN sed -i 's/listen 80/listen 8080/g' /etc/nginx/nginx.conf || true

EXPOSE 8080

HEALTHCHECK --interval=15s --timeout=3s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1
