# Start from the official Nginx image (our "base" image)
FROM nginx:alpine

# Copy our custom HTML into the Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# Document which port the container uses (informational)
EXPOSE 80

# No CMD needed - the nginx image already has one
