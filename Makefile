image = wkhtmltopdf-aas
registry = eu.gcr.io/phoenix-k8s

build:
	docker build -t local/$(image) .

tag:
	docker tag local/$(image) $(registry)/$(image)

push:
	gcloud docker -- push $(registry)/$(image)

ship: build tag push

.PHONY: build
