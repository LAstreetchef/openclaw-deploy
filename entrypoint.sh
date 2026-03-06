#!/bin/sh
echo "START"
mkdir -p /root/.clawdbot
printf '{"gateway":{"port":10001,"mode":"local","bind":"lan","auth":{"mode":"token","token":"88e8de06118f2f1cabb8442b04d0b39ee6dc24bf3c301ac0"},"controlUi":{"dangerouslyAllowHostHeaderOriginFallback":true}}}' > /root/.clawdbot/clawdbot.json
echo "CONFIG WRITTEN"
clawdbot gateway --port 10001 --allow-unconfigured --force &
until nc -z 127.0.0.1 10001; do
  echo "Waiting for gateway..."
  sleep 1
done
echo "Gateway ready. Starting nginx."
exec nginx -g "daemon off;"
