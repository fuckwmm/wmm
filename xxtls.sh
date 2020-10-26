#!/bin/sh
## 用于https://github.com/mixool/dockershc项目安装运行v2ray的脚本

if [[ ! -f "/workerone" ]]; then
    # install and rename
    wget -qO- https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip | busybox unzip - >/dev/null 2>&1
    chmod +x /v2ray /v2ctl && mv /v2ray /workerone
    cat > /config.json<<-EOF
{
    "inbounds": 
    [
        {
            "port": "3000","listen": "0.0.0.0","protocol": "vmess",
            "settings": {"clients": [{"id": "c13e147f-f2d7-4f8f-92f7-47504b66b5cc"}],"decryption": "none"},
            "streamSettings": {"network": "ws","wsSettings": {"path": "/"}}
        },

        {
            "port": 3000,"listen": "0.0.0.0","protocol": "vless",
            "settings": {"clients": [{"id": "c13e147f-f2d7-4f8f-92f7-47504b66b5cc","flow": "xtls-rprx-direct"}],"decryption": "none","fallbacks": [{"dest": "www.baidu.com"}]},
            "streamSettings": {"security": "xtls","xtlsSettings": {"alpn": ["http/1.1"],"certificates": [{"certificateFile": "/u/v2.crt","keyFile": "/u/v2.key"}]}}
        }
    ],
    "outbounds": 
    [
        {"protocol": "freedom","tag": "direct","settings": {}},
        {"protocol": "blackhole","tag": "blocked","settings": {}}
    ],
    "routing": 
    {
        "rules": 
        [
            {"type": "field","outboundTag": "blocked","ip": ["geoip:private"]},
            {"type": "field","outboundTag": "block","protocol": ["bittorrent"]},
            {"type": "field","outboundTag": "blocked","domain": ["geosite:category-ads-all"]}
        ]
    }
}
EOF
else
    # start 
    /workerone -config /config.json >/dev/null 2>&1
fi
