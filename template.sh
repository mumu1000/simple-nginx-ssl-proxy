
if [ ! -f /etc/nginx/ssl/selfsigned.key ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/selfsigned.key \
        -out /etc/nginx/ssl/selfsigned.crt \
        -subj "/CN=${PROXY_HOSTNAME}"
fi

envsubst '$BACKEND_HOST $BACKEND_PORT $PROXY_HOSTNAME' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf