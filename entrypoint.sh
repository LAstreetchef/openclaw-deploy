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
echo "=== Starting gateway ==="
clawdbot gateway --allow-unconfigured 2>&1 | tee /tmp/gateway.log &
GATEWAY_PID=$!
echo "Gateway PID: $GATEWAY_PID"
until nc -z 127.0.0.1 10001; do
  echo "Waiting for gateway..."
  cat /tmp/gateway.log 2>/dev/null | tail -5
  sleep 2
done
echo "Gateway ready. Starting nginx."
exec nginx -g "daemon off;"
