# Build Weth in a stock Go builder container
FROM golang:1.9-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /go-ethereum
RUN cd /go-ethereum && make weth

# Pull Weth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-ethereum/build/bin/weth /usr/local/bin/

EXPOSE 8285 8286 30313 30313/udp
ENTRYPOINT ["weth"]
