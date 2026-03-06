FROM node:22-slim
RUN apt-get update && apt-get install -y git socat && rm -rf /var/lib/apt/lists/*
RUN npm install -g clawdbot@2026.1.24-3
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 10000
ENTRYPOINT ["/entrypoint.sh"]
