#!/bin/sh
echo "START"
mkdir -p /root/.clawdbot
printf '{"gateway":{"port":10000,"mode":"local","bind":"lan","auth":{"mode":"token","token":"88e8de06118f2f1cabb8442b04d0b39ee6dc24bf3c301ac0"},"controlUi":{"dangerouslyAllowHostHeaderOriginFallback":true}}}' > /root/.clawdbot/clawdbot.json
echo "CONFIG WRITTEN"
exec clawdbot gateway --port 10000 --allow-unconfigured --force
