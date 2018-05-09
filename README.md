# infobot-docker

Raspberry Pi Infobot installation based on debian. Built for both amd64 and arm32v7 (Raspberry Pi 2 onwards).

Contains some custom patches.

## Source
Source: https://github.com/acrelle/infobot-docker
Infobot Source: https://svn.code.sf.net/p/infobot/code/trunk 

## Build 
[![](https://images.microbadger.com/badges/version/acrelle/infobot.svg)](https://microbadger.com/images/acrelle/infobot "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/acrelle/infobot.svg)](https://microbadger.com/images/acrelle/infobot "Get your own image badge on microbadger.com")![](https://travis-ci.com/acrelle/infobot-docker.svg?branch=master)

https://hub.docker.com/r/acrelle/infobot/

### Supported architectures

`amd64`,`arm32v7`

## Usage

```
docker run -dt \
    -v files:/home/infobot/infobot-code/files \
    -v log:/home/infobot/infobot-code/log \
    acrelle/infobot
```

## Docker Compose

Sample:

```
version: "2"
services:
  infobot:
    build: .
    image: acrelle/infobot
    container_name: infobot
    network_mode: bridge
    restart: always
    volumes:
      - ~/appdata/infobot/infobot_data/files:/home/infobot/infobot-code/files 
      - ~/appdata/infobot/infobot_data/log:/home/infobot/infobot-code/log
```
