# docker build -t mvnd:0.6.0 .
FROM openjdk:11-slim-buster as build

ADD https://github.com/mvndaemon/mvnd/releases/download/0.6.0/mvnd-0.6.0-linux-amd64.zip .

RUN --mount=type=cache,target=/var/cache/apt,rw apt-get update \
 && apt-get install unzip \
 && mkdir /opt/mvnd \
 && unzip mvnd-0.6.0-linux-amd64.zip \
 && mv mvnd-0.6.0-linux-amd64/* /opt/mvnd
