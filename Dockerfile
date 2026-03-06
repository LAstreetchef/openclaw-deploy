FROM node:22-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN npm install -g clawdbot@2026.1.24-3

RUN mkdir -p /root/.clawdbot

COPY clawdbot.json /root/.clawdbot/clawdbot.json

EXPOSE 18789

CMD ["clawdbot", "gateway"]
