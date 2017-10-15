.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/EthereumVega/weth/cmd/swarm
	go build -o bin/weth     github.com/EthereumVega/weth/cmd/weth
	go build -o bin/bootnode github.com/EthereumVega/weth/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/EthereumVega/weth/swarm/...
