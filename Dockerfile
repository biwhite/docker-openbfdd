FROM alpine:latest
MAINTAINER Ben White <ben@cuckoo.org>

RUN apk update && apk add autoconf automake g++ make bash rsyslog
ADD http://cdn.dyn.com/OpenBFDD/openbfdd-0.5.3.tar.gz /tmp/
RUN cd /tmp && \
    tar zxf /tmp/openbfdd-0.5.3.tar.gz && \
    cd openbfdd-0.5.3 && \
    ./configure && \
    make install
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.18.1.5/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /
ADD root /
VOLUME /etc/openbfdd/
ENTRYPOINT ["/init"]
