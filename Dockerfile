# Use the lightweight Nginx image
FROM nginx:alpine

# Copy your static files to the Nginx html directory
COPY . /usr/share/nginx/html

# Expose port 8080 (Cloud Run's default expected port)
EXPOSE 8080

# Update Nginx config to listen on 8080 instead of 80
RUN sed -i 's/listen  *80;/listen 8080;/g' /etc/nginx/conf.d/default.conf

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]