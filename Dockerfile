# 我究竟会有怎样的爱情
# my dockerfile

FROM ubuntu:14.04


# 安装gitcurlunzipdaemon
RUN apt-get -qq update
RUN apt-get install -q -y git curl unzip daemon

# 运行脚本
RUN mkdir -p /usr/docker
ADD autop.sh /usr/docker/autop.sh
ADD xtls.sh /usr/docker/xtls.sh
RUN chmod +x /usr/docker/autop.sh
RUN chmod +x /usr/docker/xtls.sh

EXPOSE 8888

CMD ["bash", "/usr/docker/autop.sh"]
