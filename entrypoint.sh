#!/bin/sh
mkdir -p /root/.clawdbot
cat > /root/.clawdbot/clawdbot.json << 'CONF'
{
  "gateway": {
    "port": 18789,
    "mode": "local",
    "auth": {
      "mode": "token",
      "token": "88e8de06118f2f1cabb8442b04d0b39ee6dc24bf3c301ac0"
    }
  }
}
CONF
clawdbot gateway --allow-unconfigured &
sleep 5
exec socat TCP-LISTEN:10000,fork,reuseaddr TCP:127.0.0.1:18789
