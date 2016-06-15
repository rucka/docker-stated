FROM debian:latest
MAINTAINER Gianluca Carucci <rucka@tiscalinet.it>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get --yes update && \
    apt-get --yes dist-upgrade
RUN apt-get --yes install curl && \
    curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get --yes install nodejs && \
    apt-get --yes purge curl
ADD https://github.com/etsy/statsd/tarball/master /tmp/statsd.tar.gz
RUN mkdir -p /src/statsd && tar -xzvf /tmp/statsd.tar.gz --strip-components=1 -C /src/statsd && \
    rm /tmp/statsd.tar.gz
COPY config.js /etc/statsd/config.js
EXPOSE  8125/udp
CMD ["node", "/src/statsd/stats.js", "/etc/statsd/config.js"]
