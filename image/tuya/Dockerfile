FROM   oznu/homebridge:latest

RUN \
    npm install -g @tuyapi/cli

COPY tuya.sh /opt/tuya.sh

ENTRYPOINT ["/opt/tuya.sh"]
