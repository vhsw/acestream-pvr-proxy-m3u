FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive 

ENV SUPERVISORD_CONF=/etc/supervisor/conf.d/supervisord.conf
RUN apt-get update
RUN apt-get install -y wget gnupg supervisor net-tools
# RUN mkdir -p /etc/apt/sources.list.d/
# RUN echo "deb http://repo.acestream.org/ubuntu/ trusty main" > /etc/apt/sources.list.d/acestream.list
# RUN wget -O - http://repo.acestream.org/keys/acestream.public.key | apt-key add -
RUN apt-get update

## ace-stream
#RUN apt-get install -y acestream-engine
RUN apt-get install -y libxslt1.1 libpython2.7 python-setuptools python-m2crypto python-apsw ffmpeg
RUN wget http://dl.acestream.org/linux/acestream_3.1.16_ubuntu_16.04_x86_64.tar.gz
RUN tar -xzf acestream_3.1.16_ubuntu_16.04_x86_64.tar.gz
RUN rm /acestream_3.1.16_ubuntu_16.04_x86_64.tar.gz 
RUN mv /acestream_3.1.16_ubuntu_16.04_x86_64 /opt/acestream
# RUN rm -rf /usr/share/acestream/*
# RUN mv acestream_3.1.16_ubuntu_16.04_x86_64/* /usr/share/acestream

## ace-proxy
RUN apt-get install -y python2.7 python-gevent python-psutil git
RUN git clone https://github.com/pepsik-kiev/HTTPAceProxy.git


# housekeeping
# RUN apt-get clean autoclean && \
#    apt-get autoremove && \
#    rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log


VOLUME [ "/config" ]
COPY config/supervisord.conf ${SUPERVISORD_CONF}
ADD start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

EXPOSE 8000

ENTRYPOINT ["start.sh"] 