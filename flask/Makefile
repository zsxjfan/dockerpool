CURRENT_DIRECTORY := $(shell pwd)

start:
	@docker-compose up -d

clean:
	@docker-compose rm --force

stop:
	@docker-compose stop

status:
	@docker-compose ps

cli:
	@docker exec -it $(shell docker-compose ps -q web) bash

log:
	@docker-compose logs

rebuild:
	@docker-compose build

restart:
	@docker-compose stop web
	@docker-compose start web
	@docker-compose logs

update:
	@

publish:
	@bash scripts/publish_images.sh

.PHONY: clean start stop status cli log rebuild restart update publish

