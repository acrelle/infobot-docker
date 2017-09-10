FROM arm32v7/debian:latest
MAINTAINER acrelle

# set version label
ARG BUILD_DATE
ARG VERSION


ADD discord.patch /tmp
ADD annoying.patch /tmp

# install build packages
RUN apt-get update && \
 apt-get install -y libnet-irc-perl libwww-search-perl libwww-perl libhtml-parser-perl libxml-feed-perl libsqlite0 libdbd-sqlite3-perl subversion patch && \
cd /root/ && svn checkout https://svn.code.sf.net/p/infobot/code/trunk infobot-code && \
 apt-get remove -y subversion && \
 apt-get autoremove -y && \
 apt-get purge -y  && \
 cd /root/infobot-code/src/IRC && cat /tmp/discord.patch | patch && \
 cd /root/infobot-code/src/Factoids && cat /tmp/annoying.patch | patch

# ports and volumes
VOLUME /root/infobot-code/files/
VOLUME /root/infobot-code/log/
WORKDIR /root/infobot-code/
ENTRYPOINT ["./infobot"]
