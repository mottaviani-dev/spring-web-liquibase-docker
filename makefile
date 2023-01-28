up:
	docker-compose -f /deploy/docker-compose.yml up

down:
	docker-compose -f /deploy/docker-compose.yml down

update:
	docker-compose -f /deploy/docker-compose.yml build --no-cache
	docker-compose -f /deploy/docker-compose.yml up --force-recreate
