# Image officielle NGINX
FROM nginx:alpine

# Copie la configuration personnalisée de NGINX 
COPY nginx.conf /etc/nginx/nginx.conf

# Expose le port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
