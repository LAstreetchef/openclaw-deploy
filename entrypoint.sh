#!/bin/sh
mkdir -p /root/.clawdbot
cat > /root/.clawdbot/clawdbot.json << 'CONF'
{
  "gateway": {
    "port": 10000,
    "mode": "local",
    "bind": "lan",
    "trustedProxies": ["10.0.0.0/8"],
    "auth": {
      "mode": "token",
      "token": "88e8de06118f2f1cabb8442b04d0b39ee6dc24bf3c301ac0"
    }
  }
}
CONF
echo "=== CONFIG ==="
cat /root/.clawdbot/clawdbot.json
exec clawdbot gateway --allow-unconfigured
