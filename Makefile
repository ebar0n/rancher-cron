VERSION = 0.2.1
OUTPUT_FILE = docker/dist/rancher-cron

build:
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o $(OUTPUT_FILE) && chmod +x $(OUTPUT_FILE)
package: build
	docker build -t ebar0n/rancher-cron:$(VERSION) docker
publish:
	docker tag ebar0n/rancher-cron:$(VERSION) ebar0n/rancher-cron:latest && \
	docker push ebar0n/rancher-cron:$(VERSION) && \
	docker push ebar0n/rancher-cron:latest
