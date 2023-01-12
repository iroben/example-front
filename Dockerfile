FROM nginx:1.19.2-alpine
COPY ./dist /usr/share/nginx/html
