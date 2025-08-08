#!/bin/sh

# احصل على البورت اللي Railway مديه
PORT=${PORT:-8080}  # لو مش موجود هيرجع 8080 كـ default

# اكتب config ديناميكي بالـ PORT ده
cat > /etc/xray/config.json <<EOF
{
  "log": {
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "port": $PORT,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "11111111-1111-1111-1111-111111111111",
            "alterId": 0
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/yt"
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

# شغل Xray
xray -config /etc/xray/config.json
