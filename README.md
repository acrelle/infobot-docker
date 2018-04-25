# rpi-infobot

Raspberry Pi Infobot installation, uses arm32v7/debian:latest (Raspberry Pi 2 onwards).

## Build status
[![](https://images.microbadger.com/badges/version/acrelle/rpi-infobot.svg)](https://microbadger.com/images/acrelle/rpi-infobot "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/acrelle/rpi-infobot.svg)](https://microbadger.com/images/acrelle/rpi-infobot "Get your own image badge on microbadger.com")[![Build Status](https://jenkins.relle.uk/buildStatus/icon?job=rpi-infobot)](https://jenkins.relle.uk/job/rpi-infobot)

## Source
Source: https://github.com/acrelle/infobot-docker
Infobot Source: https://svn.code.sf.net/p/infobot/code/trunk 

## Usage

```
docker run -dt -v infobot.sqlite:/root/infobot-code/infobot.sqlite 
-v files:/root/infobot-code/files/
 -v log:/root/infobot-code/log/ 
acrelle/infobot:latest
```

## Docker Compose

Sample:

```
version: "2"
services:
  infobot:
    build: .
    image: acrelle/rpi-infobot
    container_name: infobot
    network_mode: bridge
    restart: always
    volumes:
      - ~/appdata/infobot/infobot_data/infobot.sqlite:/root/infobot-code/infobot.sqlite 
      - ~/appdata/infobot/infobot_data/files/:/root/infobot-code/files/ 
      - ~/appdata/infobot/infobot_data/log/:/root/infobot-code/log/
```
