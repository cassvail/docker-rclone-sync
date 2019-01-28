FROM alpine:3.8

ENV RCLONE_VERSION="current"
ENV RCLONE_ARCH="amd64"

ENV SYNC_DESTINATION=""
ENV SYNC_DESTINATION_PATH=""

ENV DELAY 1h

RUN \
apk update && \
apk add --no-cache \
ca-certificates

RUN \
apk add --no-cache --virtual=build-dependencies \
wget \
unzip

RUN cd /tmp \
&& wget -q http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip \
&& unzip /tmp/rclone-${RCLONE_VERSION}-linux-${RCLONE_ARCH}.zip \
&& mv /tmp/rclone-*-linux-${RCLONE_ARCH}/rclone /usr/bin \
&& rm -r /tmp/rclone* \
&& addgroup rclone \
&& adduser -h /config -s /bin/ash -G rclone -D rclone

# cleanup
RUN apk del --purge \
build-dependencies && \
rm -rf \
/tmp/* \
/var/tmp/* \
/var/cache/apk/*

RUN mkdir -p /config /rclone_config /data

VOLUME ["/data"]
VOLUME ["/rclone_config"]

ADD resources/* /

RUN chmod +x /command.sh

USER rclone

CMD ["/command.sh"]
