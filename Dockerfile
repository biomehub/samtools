FROM alpine:3.13.2
MAINTAINER lfelipedeoliveira, felipe@biome-hub.com

ENV APP_NAME=samtools
ENV VERSION=1.11

#RUN echo 'https://dl-cdn.alpinelinux.org/alpine/edge/testing'  >> /etc/apk/repositories

RUN apk add build-base py-pip jpeg-dev zlib-dev gcc g++ make perl bzip2-dev xz-dev

# Download & install
 RUN wget https://github.com/samtools/samtools/releases/download/$VERSION/samtools-$VERSION.tar.bz2 \
  && tar -xvjf samtools-$VERSION.tar.bz2 \
  && cd samtools-$VERSION \
  && ./configure --without-curses \
  && mv bin/* /usr/bin \
  && make \
  && make install \
  && cd / \
  && rm -r /samtools-$VERSION
