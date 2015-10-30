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
	@docker exec -it $(shell docker-compose ps -q go-app) bash

log:
	@docker-compose logs

rebuild:
	@docker-compose build

restart:
	@docker-compose stop go-app
	@docker-compose start go-app
	@docker-compose logs

.PHONY: clean start stop status cli log rebuild restart

