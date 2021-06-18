FROM alpine:latest

RUN apk add --no-cache bash util-linux openssl jq inotify-tools
COPY ["dumpcerts.sh", "./dumpcerts.sh"]
RUN chmod +x ./dumpcerts.sh
COPY ["monitor-acme-file-for-changes", "./monitor-acme-file-for-changes"]
RUN chmod +x ./monitor-acme-file-for-changes

VOLUME ["/acme", "/certs"]

CMD ["./monitor-acme-file-for-changes", "/acme/acme.json", "/certs"]
