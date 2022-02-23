FROM nginx:1.21.6-alpine
COPY ./src/index.html /usr/share/nginx/html
EXPOSE 80