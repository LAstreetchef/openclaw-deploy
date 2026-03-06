#!/bin/sh
echo "=== Running as: $(whoami), HOME=$HOME ==="
mkdir -p $HOME/.clawdbot
cat > $HOME/.clawdbot/clawdbot.json << 'CONF'
{
  "gateway": {
    "port": 10001,
    "mode": "local",
    "bind": "lan",
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
echo "=== Config written to $HOME/.clawdbot/clawdbot.json ==="
clawdbot gateway --port 10001 --allow-unconfigured --force &
until nc -z 127.0.0.1 10001; do
  echo "Waiting for gateway..."
  sleep 1
done
echo "Gateway ready. Starting nginx."
exec nginx -g "daemon off;"
