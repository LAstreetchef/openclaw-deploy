FROM node:20-slim

RUN npm install -g clawdbot

RUN mkdir -p /root/.clawdbot

COPY clawdbot.json /root/.clawdbot/clawdbot.json

EXPOSE 18789

CMD ["clawdbot", "gateway"]
