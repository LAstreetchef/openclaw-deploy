FROM node:22-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN npm install -g clawdbot@2026.1.24-3

RUN mkdir -p /root/.clawdbot

COPY clawdbot.json /root/.clawdbot/clawdbot.json

ENV CLAWDBOT_GATEWAY_TRUSTED_PROXIES="10.0.0.0/8"
ENV CLAWDBOT_GATEWAY_AUTH_TOKEN="88e8de06118f2f1cabb8442b04d0b39ee6dc24bf3c301ac0"
ENV CLAWDBOT_GATEWAY_PORT="10000"

EXPOSE 10000

CMD ["clawdbot", "gateway", "--allow-unconfigured"]
