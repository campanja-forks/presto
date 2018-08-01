REGISTRY = registry.dev.campanja.net
PROJECT = presto
VERSION := $(shell git describe --always --dirty)

PRESTO_VERSION := "$(shell git describe | cut -d- -f1)"

all:

image:
	docker build --build-arg PRESTO_VERSION=$(PRESTO_VERSION) \
		--rm -t $(REGISTRY)/$(PROJECT):$(VERSION) .

push: image
	docker push $(REGISTRY)/$(PROJECT):$(VERSION)
