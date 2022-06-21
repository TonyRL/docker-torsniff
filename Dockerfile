FROM golang:alpine AS builder

RUN \
 apk add --no-cache build-base curl git && \
 go install -v github.com/fanpei91/torsniff@latest


FROM lsiobase/alpine:3.16

COPY --from=builder /go/bin/torsniff /root/torsniff

EXPOSE 6881/udp
VOLUME /root/torrents

ENTRYPOINT ["/root/torsniff"]
