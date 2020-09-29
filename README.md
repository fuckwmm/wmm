# 王萌
终极配置，详请参见，终极多合一配置xtls

https://github.com/v2fly/v2ray-examples/tree/master/VLESS-TCP-XTLS-WHATEVER

VLESS over TCP with XTLS + 回落 & 分流 to WHATEVER（终极配置）
这里是 进阶配置 的超集，利用 VLESS 强大的回落分流特性，实现了 443 端口尽可能多的协议、配置的完美共存，包括 XTLS

客户端可以同时通过下列方式连接到服务器，其中 WS 都可以通过 CDN

VLESS over TCP with XTLS

VLESS over TCP with TLS

VLESS over WS with TLS

VMess over TCP with TLS

VMess over WS with TLS
