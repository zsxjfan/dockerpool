FROM p0bailey/docker-flask
MAINTAINER xhx <xiao@bingofresh.com>

RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

RUN echo '[local]\n10.163.194.169\n' > /etc/ansible/hosts && \
    echo '[test]\n10.144.141.185\n' >> /etc/ansible/hosts

ADD ./id_rsa /root/.ssh/id_rsa
ADD ./id_rsa.pub /root/.ssh/id_rsa.pub
ADD ./playbook /opt/ansible/playbook
ADD ./app/hello.py /var/www/app/hello.py

# 解决时区问题
env TZ "Asia/Shanghai"
