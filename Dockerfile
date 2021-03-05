FROM alpine

RUN apk -U update
RUN apk add py3-pip bash dumb-init
RUN pip3 install fs-watcher

ADD entrypoint.sh /
ADD healthcheck.sh /

ENTRYPOINT ["dumb-init", "/entrypoint.sh"]

HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD /healthcheck.sh
