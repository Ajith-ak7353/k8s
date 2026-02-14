FROM nginx:alpine

# Copy your custom configuration (optional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Copy static website files to the default NGINX directory
COPY . /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
