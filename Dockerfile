FROM seblucas/alpine-python3:latest
LABEL maintainer="Sebastien Lucas <sebastien@slucas.fr>"
LABEL Description="mqtt healthcheck image"

COPY * /usr/bin/

RUN chmod +x /usr/bin/mqtt-healthcheck.py

ENTRYPOINT ["python3", "-u", "/usr/bin/mqtt_healthcheck.py"]

