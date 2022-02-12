FROM ubuntu

ENV workspace=/tmp
COPY . ${workspace}

WORKDIR ${workspace}
RUN apt update && apt install wget -y;chmod +x ${workspace}/StudioInstaller.sh
RUN ${workspace}/StudioInstaller.sh
