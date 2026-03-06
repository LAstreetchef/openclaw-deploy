#!/bin/sh
mkdir -p /root/.clawdbot
cat > /root/.clawdbot/clawdbot.json << 'CONF'
{
  "gateway": {
    "port": 10001,
    "mode": "local",
    "auth": {
      "mode": "token",
      "token": "88e8de06118f2f1cabb8442b04d0b39ee6dc24bf3c301ac0"
    },
    "controlUi": {
      "dangerouslyAllowHostHeaderOriginFallback": true
    }
  }
}
CONF
echo "=== Launching gateway ==="
clawdbot gateway --port 10001 --allow-unconfigured --force
echo "=== Gateway exited with code $? ==="
