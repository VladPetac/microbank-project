# MicroBank Nginx - API Gateway / Reverse Proxy
FROM nginx:1.27-alpine

RUN apk update && apk upgrade --no-cache

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom config
COPY nginx.conf /etc/nginx/nginx.conf

# Non-root user (nginx image supports this)
EXPOSE 80

HEALTHCHECK --interval=15s --timeout=3s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:80/health || exit 1
