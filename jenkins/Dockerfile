FROM index.csphere.cn/microimages/jenkins
MAINTAINER xhx <xiao@bingofresh.com>

RUN apk add --update make cmake gcc g++ build-base && \
    apk add --update python py-pip python-dev && \
    pip install ansible

# 解决时区问题
RUN apk add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

ADD ./id_rsa /root/.ssh/id_rsa
ADD ./id_rsa.pub /root/.ssh/id_rsa.pub
ADD ./ansible/hosts /etc/ansible/hosts
ADD ./known_hosts /root/.ssh/known_hosts
ADD ./ansible /opt/ansible
