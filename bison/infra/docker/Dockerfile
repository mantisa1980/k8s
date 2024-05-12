FROM ubuntu:20.04
LABEL maintainer="duyhsieh@igs.com.tw"

RUN apt-get update && \
  ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
  apt-get install -y build-essential manpages-dev libffi-dev libssl-dev python2 python-dev gcc tzdata curl vim gnupg iputils-ping sudo htop openssh-client sshpass && \
  apt-get clean

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py && /usr/bin/python2 get-pip.py && rm get-pip.py
RUN pip2.7 install PyNaCl==1.4.0 hiredis==1.1.0 asn1crypto==0.23.0 bcrypt==3.1.7 boto==2.42.0 boto3==1.4.0 botocore==1.4.93 cachetools==3.1.1 \
    certifi==2017.7.27.1 cffi==1.11.0 chardet==3.0.4 click==7.1.2 crcmod==1.7 cryptography==2.0.3 dicttoxml==1.6.6 docutils==0.16 enum34==1.1.6 \
    falcon==1.2.0 futures==3.1.1 geoip2==2.1.0 geomet==0.2.1.post1 gevent==1.2.2 gevent-websocket==0.10.1 google-auth==1.26.1 greenlet==0.4.12 \
    gunicorn==19.3.0 idna==2.6 importlib==1.0.3 ipaddress==1.0.18 Jinja2==2.9.6 jmespath==0.10.0 kafka-python==2.0.2 kazoo==2.8.0 MarkupSafe==1.1.1 \
    maxminddb==1.4.1 oauthlib==3.1.0 oss2==2.2.0 paramiko==2.4.1 polib==1.1.0 pyasn1==0.4.8 pyasn1-modules==0.2.8 pycparser==2.20 pycrypto==2.6 \
    pyjade==4.0.0 PyJWT==1.7.1 pymongo==3.12.3 PyNaCl==1.4.0 pyOpenSSL==17.2.0 python-dateutil==2.6.1 python-mimeparse==1.6.0 pytz==2016.6.1 \
    redis==2.10.6 requests==2.18.4 requests-oauthlib==0.8.0 rsa==4.5 s3transfer==0.1.13 simplejson==3.13.2 six==1.12.0 tweepy==3.3.0 ujson==1.35 \
    urllib3==1.22 websocket==0.2.1 websocket-client==0.44.0 Werkzeug==0.9.6 xlrd==1.1.0 xlutils==1.7.1 xlwt==1.3.0 xmltodict==0.9.2 \
    wheel==0.31.0 future==0.18.2  colorama==0.4.4 chromalog==1.0.5 oauth2client==4.1.3 pyconcrete==0.11.3 numpy==1.16.6 icecream hash_ring==1.3.1 \
    httplib2==0.22.0

RUN echo 'export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"' >> /root/.bashrc

RUN curl https://pgp.mongodb.com/server-5.0.asc | sudo apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN apt-get update && apt-get install -y mongodb-org-shell=5.0.7 mongodb-org-tools=5.0.7 mongodb-mongosh redis-tools dos2unix && apt-get clean


# downgrade pip so that we can use ArkTool Pack in docker container ......................
RUN pip2.7 install pip==6.0.1

RUN mkdir -p /var/run/igs
RUN mkdir -p /igs/project

# to avoid mongosh startup warning
RUN ln -s /root/.mongorc.js /root/.mongoshrc.js
WORKDIR /project

ENV LC_ALL=C.UTF-8
