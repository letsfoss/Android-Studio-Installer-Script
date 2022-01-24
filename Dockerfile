FROM ubuntu
COPY . /tmp

WORKDIR /tmp
RUN apt update && apt install wget
RUN ./StudioInstaller.sh
