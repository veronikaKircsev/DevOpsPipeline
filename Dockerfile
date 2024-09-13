FROM nginx:stable-alpine3.17-slim
COPY indexHello.html /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]