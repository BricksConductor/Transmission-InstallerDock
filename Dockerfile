FROM ubuntu:20.04


RUN apt update && apt-get -y install transmission-cli transmission-common transmission-daemon

RUN sed -i 's|"rpc-host-whitelist": ".*",|"rpc-host-whitelist": "clod54-33mc03sz.b4a.run",|g' /etc/transmission-daemon/settings.json

EXPOSE 3000 7000 42069/tcp 42069/udp 5489/tcp 5489/udp 9091


CMD ["transmission-daemon", "-f"]
