.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/EthereumVega/EVA-00D/cmd/swarm
	go build -o bin/geth     github.com/EthereumVega/EVA-00D/cmd/geth
	go build -o bin/bootnode github.com/EthereumVega/EVA-00D/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/EthereumVega/EVA-00D/swarm/...
