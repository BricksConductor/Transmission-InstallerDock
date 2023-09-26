FROM ubuntu:20.04


RUN apt update && apt-get -y install transmission-cli transmission-common transmission-daemon

RUN sed -i 's/"rpc-whitelist": "127.0.0.1"/"rpc-whitelist": "*.*.*.*"/g' /etc/transmission-daemon/settings.json
RUN sed -i 's/"rpc-whitelist-enabled": true,/"rpc-whitelist-enabled": false,/g' /etc/transmission-daemon/settings.json
RUN sed -i 's/"rpc-authentication-required": false,/"rpc-authentication-required": true,/g' /etc/transmission-daemon/settings.json
RUN sed -i 's/"rpc-username": "",/"rpc-username": "your-username",/g' /etc/transmission-daemon/settings.json
RUN sed -i 's|"rpc-password": "{.*}",|"rpc-password": "{your-password}",|g' /etc/transmission-daemon/settings.json

EXPOSE 3000 7000 42069/tcp 42069/udp 5489/tcp 5489/udp 9091


CMD ["transmission-daemon", "-f", "-a", "*.*.*.*"]
