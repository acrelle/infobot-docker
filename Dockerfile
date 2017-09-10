FROM arm32v7/debian:latest
MAINTAINER acrelle

# set version label
ARG BUILD_DATE
ARG VERSION

# install build packages
RUN apt-get update
RUN apt-get install -y libnet-irc-perl libwww-search-perl libwww-perl libhtml-parser-perl libxml-feed-perl libsqlite0 libdbd-sqlite3-perl subversion

# fetch and unpack source
RUN cd /root/ && svn checkout https://svn.code.sf.net/p/infobot/code/trunk infobot-code

#cleanup
RUN apt-get remove -y subversion
RUN apt-get autoremove -y

# ports and volumes
VOLUME /root/infobot-code/files/ 
VOLUME /root/infobot-code/log/

WORKDIR /root/infobot-code/
ENTRYPOINT ["./infobot"]
