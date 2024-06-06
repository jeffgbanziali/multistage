# Stage 1: Base Ubuntu image to fetch source files
FROM ubuntu:latest AS base
WORKDIR /app
COPY . /app

# Stage 2: Apache HTTPD
FROM httpd:alpine AS httpd
COPY --from=base /app /usr/local/apache2/htdocs/

# Stage 3: Nginx
FROM nginx:alpine AS nginx
COPY --from=base /app /usr/share/nginx/html
