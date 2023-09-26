FROM ubuntu:20.04


RUN apt update && apt-get -y install transmission-cli transmission-common transmission-daemon

RUN service transmission-daemon stop
RUN sed -i 's/"rpc-whitelist": "127.0.0.1"/"rpc-whitelist": "*.*.*.*"/g' /etc/transmission-daemon/settings.json
RUN sed -i 's/"rpc-whitelist-enabled": true,/"rpc-whitelist-enabled": false,/g' /etc/transmission-daemon/settings.json
EXPOSE 3000 7000 42069 5489 9091


CMD ["transmission-daemon", "-f"]
