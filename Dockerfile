FROM nginx:latest

RUN apt-get update && apt-get install -y openssl gettext-base

RUN mkdir -p /etc/nginx/ssl

COPY default.conf.template /etc/nginx/templates/default.conf.template

COPY template.sh /docker-entrypoint.d/template.sh

RUN chmod +x /docker-entrypoint.d/template.sh

ENV BACKEND_HOST=backend

ENV BACKEND_PORT=80

ENV PROXY_HOSTNAME=localhost