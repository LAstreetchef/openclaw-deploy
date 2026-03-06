#!/bin/sh
mkdir -p /root/.clawdbot
cat > /root/.clawdbot/clawdbot.json << 'CONF'
{
  "meta": {
    "lastTouchedVersion": "2026.1.24-3",
    "lastTouchedAt": "2026-03-06T00:00:00.000Z"
  },
  "gateway": {
    "port": 10000,
    "mode": "local",
    "bind": "lan",
    "trustedProxies": ["10.0.0.0/8"],
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
echo "=== CONFIG ==="
cat /root/.clawdbot/clawdbot.json
exec clawdbot gateway --allow-unconfigured
