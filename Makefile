### Makefile for kvproto

CURDIR := $(shell pwd)

KEEP_FILE := '**/*.proto,**/*.sh'

export PATH := $(CURDIR)/_vendor/bin:$(PATH)
export GOPATH := $(CURDIR)/_vendor

all: go rust test

test:
	# Build test.
	go build ./pkg/...
	cargo check

go: 
	# Standalone GOPATH
	./generate_go.sh

rust: 
	./generate_rust.sh

.PHONY: all
