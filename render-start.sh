#!/bin/sh

# Chạy tiến trình ngầm đợi server khởi động 10 giây rồi tự nạp data.json
(
  sleep 10
  if [ -f "/app/data/data.json" ]; then
    echo "Dang tu dong khoi phuc du lieu tu data.json..."
    curl -s -X POST "http://127.0.0.1:${PORT:-20128}/api/settings/import" \
      -H "Content-Type: application/json" \
      -d @/app/data/data.json
    echo "Khoi phuc du lieu hoan tat!"
  fi
) &

# Khởi chạy máy chủ chính của 9Router
exec node custom-server.js
