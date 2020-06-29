FROM lsiobase/ubuntu:bionic

# environment variables
ARG DEBIAN_FRONTEND="noninteractive"
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS="2"

RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y \
    python3 \
    python3-pip && \
  echo "**** install python modules ****" && \
  pip3 install -U --no-cache-dir pip && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/* \
  	/var/lib/apt/lists/* \
  	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 5050/tcp
VOLUME /config
