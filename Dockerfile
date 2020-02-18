FROM golang:1.13-alpine AS builder

RUN \
 apk add --no-cache build-base curl git && \
 go build -o torsniff \


FROM alpine:latest

COPY --from=builder /torsniff/torrsniff /root/torsniff

EXPOSE 6881 6881/udp
VOLUME /root/torrents

ENTRYPOINT ["/root/torsniff"]