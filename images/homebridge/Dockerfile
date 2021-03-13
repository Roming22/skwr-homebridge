FROM   oznu/homebridge:latest

ENV \
    HOMEBRIDGE_CONFIG_UI=1

#RUN \
#    npm install -g \
#    homebridge-config-ui-x@latest
#    homebridge-nest@latest \
#    homebridge-tuya@latest

#
# Default skwr config
#
ENV PATH="/opt/module/bin:$PATH"
ENTRYPOINT ["run.sh"]
HEALTHCHECK --start-period=10s --interval=30s --timeout=5s --retries=3 \
    CMD healthcheck.sh || exit 1

# Add module
COPY module /opt/module
RUN chmod +x /opt/module/bin/*.sh
