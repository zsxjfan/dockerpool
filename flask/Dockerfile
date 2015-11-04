FROM p0bailey/docker-flask
MAINTAINER xhx <xiao@bingofresh.com>

RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

RUN echo '[local]\n115.28.155.18\n' > /etc/ansible/hosts
ADD ./id_rsa /root/.ssh/id_rsa
ADD ./id_rsa.pub /root/.ssh/id_rsa.pub
ADD ./playbook /data/playbook
