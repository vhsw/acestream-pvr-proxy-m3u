FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive 
# ENV HOME "/root"
ENV SUPERVISORD_CONF=/etc/supervisor/conf.d/supervisord.conf
RUN apt-get update
RUN apt-get install -y wget gnupg supervisor
RUN mkdir -p /etc/apt/sources.list.d/
RUN echo "deb http://repo.acestream.org/ubuntu/ trusty main" > /etc/apt/sources.list.d/acestream.list
RUN wget -O - http://repo.acestream.org/keys/acestream.public.key | apt-key add -
RUN apt-get update

## ace-stream
RUN apt-get install -y acestream-engine

## ace-proxy
RUN apt-get install -y python2.7 python-gevent python-psutil git
RUN git clone https://github.com/ValdikSS/aceproxy.git

# housekeeping
#RUN apt-get clean autoclean && \
#    apt-get autoremove && \
#    rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log


VOLUME [ "/config" ]
COPY config/supervisord.conf ${SUPERVISORD_CONF}
ADD start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

EXPOSE 8000

ENTRYPOINT start.sh ${SUPERVISORD_CONF}