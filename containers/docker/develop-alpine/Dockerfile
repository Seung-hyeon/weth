FROM alpine:3.5

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 https://github.com/EthereumVega/weth && \
  (cd go-ethereum && make weth) && \
  cp go-ethereum/build/bin/weth /weth && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /go-ethereum && rm -rf /var/cache/apk/*

EXPOSE 8285
EXPOSE 30313

ENTRYPOINT ["/weth"]
