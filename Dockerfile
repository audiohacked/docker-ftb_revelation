# Copyright 2015-2019 Sean Nelson <audiohacked@gmail.com>
FROM audiohacked/ftb_base:latest
LABEL maintainer="audiohacked@gmail.com"

ARG MODPACK="FTBRevelation"
ARG FTB_VERSION="3_2_0"
ARG BASE_URL="https://ftb.forgecdn.net/FTB2/modpacks/${MODPACK}"
ARG SERVER_FILE="${MODPACK}Server.zip"

WORKDIR /minecraft

USER minecraft

ADD --chown=minecraft ${BASE_URL}/${FTB_VERSION}/${SERVER_FILE} .
RUN unzip ${SERVER_FILE}
RUN chmod u+x FTBInstall.sh ServerStart.sh
RUN sed -i '2i /bin/sh /minecraft/CheckEula.sh' /minecraft/ServerStart.sh
RUN /minecraft/FTBInstall.sh
