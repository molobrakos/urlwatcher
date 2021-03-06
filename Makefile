CACHE_DIR=$(HOME)/.cache
CONFIG_DIR=$(HOME)/.config

build:
	docker build -t urlwatcher .

run:
	mkdir -p $(CACHE_DIR)/urlwatcher/pyppeteer
	docker run \
	--rm \
	--net=bridge \
	--name=urlwatcher \
	--hostname=urlwatcher \
	-v $(CONFIG_DIR)/urlwatcher.yaml:/config/urlwatcher.yaml:ro \
	-v $(CACHE_DIR)/urlwatcher:/cache/urlwatcher:rw \
	-v $(CACHE_DIR)/urlwatcher/pyppeteer:/app/.pyppeteer:rw \
	-e XDG_CONFIG_HOME=/config \
	-e XDG_CACHE_HOME=/cache \
	urlwatcher -vv
