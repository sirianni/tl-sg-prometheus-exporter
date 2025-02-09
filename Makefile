VERSION=0.1.0

.PHONY: build
build:
	podman build --tag sirianni/tl-sg-prometheus-exporter .

publish: build
	podman tag sirianni/tl-sg-prometheus-exporter sirianni/tl-sg-prometheus-exporter:$(VERSION)
	podman push sirianni/tl-sg-prometheus-exporter:$(VERSION)
	podman push sirianni/tl-sg-prometheus-exporter:latest