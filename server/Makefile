VERSION=$(shell node -p "require('./package.json').version")
PACKAGE_NAME=$(shell node -p "require('./package.json').name")

.PHONY: all deploy clean

all: clean
	npx tsc
	docker build -t $(PACKAGE_NAME) .
	docker tag $(PACKAGE_NAME) docker.costaoeste.es:5000/$(PACKAGE_NAME):v$(VERSION)
	docker tag $(PACKAGE_NAME) docker.costaoeste.es:5000/$(PACKAGE_NAME):latest

clean:
	rm -r dist

deploy:
	docker push backend.com:5000/$(PACKAGE_NAME)
