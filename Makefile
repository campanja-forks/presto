REGISTRY = registry.dev.campanja.net
PROJECT = presto
VERSION := $(shell git describe --always --dirty)

PRESTO_VERSION := "$(shell git describe | cut -d- -f1)"
BRANCH := "$(shell git rev-parse --abbrev-ref HEAD)"

all:

image:
	docker build --build-arg PRESTO_VERSION=$(PRESTO_VERSION) \
		--build-arg CAMPANJA_BRANCH=$(BRANCH) \
		--rm -t $(REGISTRY)/$(PROJECT):$(VERSION) .

push: image
	docker push $(REGISTRY)/$(PROJECT):$(VERSION)
