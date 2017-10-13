# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: weth android ios weth-cross swarm evm all test clean
.PHONY: weth-linux weth-linux-386 weth-linux-amd64 weth-linux-mips64 weth-linux-mips64le
.PHONY: weth-linux-arm weth-linux-arm-5 weth-linux-arm-6 weth-linux-arm-7 weth-linux-arm64
.PHONY: weth-darwin weth-darwin-386 weth-darwin-amd64
.PHONY: weth-windows weth-windows-386 weth-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

weth:
	build/env.sh go run build/ci.go install ./cmd/weth
	@echo "Done building."
	@echo "Run \"$(GOBIN)/weth\" to launch weth."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/weth.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/Weth.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u golang.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/jteeuwen/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go install ./cmd/abigen

# Cross Compilation Targets (xgo)

weth-cross: weth-linux weth-darwin weth-windows weth-android weth-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/weth-*

weth-linux: weth-linux-386 weth-linux-amd64 weth-linux-arm weth-linux-mips64 weth-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-*

weth-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/weth
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-* | grep 386

weth-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/weth
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-* | grep amd64

weth-linux-arm: weth-linux-arm-5 weth-linux-arm-6 weth-linux-arm-7 weth-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-* | grep arm

weth-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/weth
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-* | grep arm-5

weth-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/weth
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-* | grep arm-6

weth-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/weth
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-* | grep arm-7

weth-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/weth
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-* | grep arm64

weth-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/weth
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-* | grep mips

weth-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/weth
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-* | grep mipsle

weth-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/weth
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-* | grep mips64

weth-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/weth
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/weth-linux-* | grep mips64le

weth-darwin: weth-darwin-386 weth-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/weth-darwin-*

weth-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/weth
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/weth-darwin-* | grep 386

weth-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/weth
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/weth-darwin-* | grep amd64

weth-windows: weth-windows-386 weth-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/weth-windows-*

weth-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/weth
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/weth-windows-* | grep 386

weth-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/weth
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/weth-windows-* | grep amd64
