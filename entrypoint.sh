#!/bin/sh
mkdir -p /root/.clawdbot
cp /tmp/clawdbot-template.json /root/.clawdbot/clawdbot.json
echo "Config written:"
cat /root/.clawdbot/clawdbot.json | grep -A2 "trustedProxies"
exec clawdbot gateway --allow-unconfigured
