image = wkhtmltopdf-aas 
registry = eu.gcr.io/dauntless-nova-163713

build:
	docker build -t local/$(image) .

tag:
	docker tag local/$(image) $(registry)/$(image)

push:
	gcloud docker -- push $(registry)/$(image)

ship: build tag push

.PHONY: build
