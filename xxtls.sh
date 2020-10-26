#!/bin/sh
## 用于https://github.com/mixool/dockershc项目安装运行v2ray的脚本

if [[ ! -f "/workerone" ]]; then
    # install and rename
    wget -qO- https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip | busybox unzip - >/dev/null 2>&1
    chmod +x /v2ray /v2ctl && mv /v2ray /workerone
    wget -q0- https://raw.githubusercontent.com/fuckwmm/wmm/master/xddtls.json
    
else
    # start 
    /workerone -config /xddtls.json >/dev/null 2>&1
fi
