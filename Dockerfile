FROM alpine:latest

RUN apk add --no-cache bash util-linux openssl jq inotify-tools
RUN wget https://raw.githubusercontent.com/containous/traefik/master/contrib/scripts/dumpcerts.sh && \
    chmod +x dumpcerts.sh
COPY ["monitor-acme-file-for-changes", "./monitor-acme-file-for-changes"]
RUN chmod +x ./monitor-acme-file-for-changes

CMD ["./monitor-acme-file-for-changes", "/in/acme.json", "/out"]
