# Makefile to build and push the container image

MAKEFLAGS += --warn-undefined-variables
.DEFAULT_GOAL := build

# Verbosity
V ?= 0

verbose_0 = @
verbose_2 = set -x;
verbose = $(verbose_$(V))

CURDIR := $(shell pwd)
# BASEDIR := $(abspath $(CURDIR)/..)
BASEDIR := $(abspath $(CURDIR))

DOCKER ?= docker

PROJECT ?= easy-ver 
PROJECT_SEMVER ?= $(shell git describe --abbrev=7 | sed 's/\(.*\)-/\1./')
REPO ?= github.com/lmickh/easy-ver

namespace ?= container.repo.fqdn/corp
image := $(namespace)/easy-ver

# Targets

all:: build ship
.PHONEY: all

build:
	go build -ldflags '-X $(REPO)/cmd.projectVersion=$(PROJECT_SEMVER)'
.PHONEY: build

build-image:
	$(verbose) $(DOCKER) build -f "$(CURDIR)/Dockerfile" -t "$(PROJECT):$(PROJECT_SEMVER)" "$(BASEDIR)"
.PHONEY: build-image
