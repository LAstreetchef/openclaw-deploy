FROM node:22-slim
RUN apt-get update && apt-get install -y nginx git netcat-openbsd && rm -rf /var/lib/apt/lists/*
RUN npm install -g clawdbot@2026.1.24-3
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 10000
ENTRYPOINT ["/entrypoint.sh"]
