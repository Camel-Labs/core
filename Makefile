VERSION := $(shell echo $(shell git describe --tags) | sed 's/^v//')
COMMIT := $(shell git log -1 --format='%H')

ldflags = -X github.com/cosmos/cosmos-sdk/version.Name=camel \
	-X github.com/cosmos/cosmos-sdk/version.ServerName=cameld \
	-X github.com/cosmos/cosmos-sdk/version.ClientName=camelcli \
	-X github.com/cosmos/cosmos-sdk/version.Version=$(VERSION) \
	-X github.com/cosmos/cosmos-sdk/version.Commit=$(COMMIT)

BUILD_FLAGS := -ldflags '$(ldflags)'

all: install

install: go.sum
	go install -tags "$(build_tags)" ./cmd/cameld
	go install -tags "$(build_tags)" ./cmd/camelcli

go.sum: go.mod
	@echo "--> Ensure dependencies have not been modified"
	@go mod verify