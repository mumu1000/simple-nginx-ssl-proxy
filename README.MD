# Simple Nginx SSL Proxy Container

A simple way to put an https cert on any http endpoint using nginx and docker

Configure it using env vars:
BACKEND_HOST=mysite
BACKEND_PORT=8080
PROXY_HOSTNAME=mysite.example.com

Either have it generate self signed certs or provide your own cert & key by mounting them in the proxy container
```bash
      - "./certs/mysite.pem:/etc/nginx/ssl/selfsigned.crt:ro"
      - "./certs/mysite-key.pem:/etc/nginx/ssl/selfsigned.key:ro"
```

A simple docker-compose.yml file is provided as an example