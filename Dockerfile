FROM golang:alpine AS builder

RUN \
 apk add --no-cache build-base curl git && \
 go get -u -v github.com/fanpei91/torsniff


FROM lsiobase/alpine:latest

COPY --from=builder /go/bin/torsniff /root/torsniff

EXPOSE 6881/udp
VOLUME /root/torrents

ENTRYPOINT ["/root/torsniff"]
