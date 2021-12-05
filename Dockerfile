FROM ruby:3.0.3-alpine3.15
RUN apk --update --no-cache add shadow sudo busybox-suid execline tzdata mariadb-connector-c-dev alpine-sdk && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN gem install rails
WORKDIR /usr/src/app