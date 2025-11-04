# syntax=docker/dockerfile:1

FROM eclipse-temurin:8u312-jre

LABEL version="3.7.0"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Revelation"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/55/5580d403cda892c044d771fa2f1da6295478883f70ae3075e085a9ba317f4e76.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTB-Revelation:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Revelation v3.7.0 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]