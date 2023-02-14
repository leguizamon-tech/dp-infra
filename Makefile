.PHONY: start

define DEFAULT_ENV
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DATA=./data
endef

export DEFAULT_ENV

write_default_env_values:
	@echo "$$DEFAULT_ENV" > .env

setup_env_file:
	test -f .env || (touch .env && $(MAKE) write_default_env_values)

start: setup_env_file
	docker-compose up -d

stop:
	docker-compose down
