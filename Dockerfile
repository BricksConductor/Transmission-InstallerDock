FROM ubuntu:20.04

RUN apt update && apt-get -y install transmission-cli transmission-common transmission-daemon

EXPOSE 3000 7000 42069 5489 9091

CMD  transmission-daemon
