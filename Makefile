.PHONY: start stop logs renew clean clean-all rebuild

build-pro:
	docker compose -f compose.prod.yaml build
rebuild-pro:
	docker compose -f compose.prod.yaml down
	docker compose -f compose.prod.yaml build --no-cache
	docker compose -f compose.prod.yaml up -d
up-pro:
	docker compose -f compose.prod.yaml up -d
down-pro:
	sudo docker compose -f compose.prod.yaml down
clear-pro:
	docker compose -f compose.prod.yaml down --remove-orphans
	docker system prune -f
	sudo systemctl restart docker

build-dev:
	docker compose -f compose.dev.yaml build
up-dev:
	docker compose -f compose.dev.yaml up -d	
down-dev:
	sudo docker compose -f compose.dev.yaml down		

clear-all:
	docker stop $$(docker ps -aq) 2>/dev/null || true
	docker rm -f $$(docker ps -aq) 2>/dev/null || true
	docker rmi -f $$(docker images -aq) 2>/dev/null || true
	docker volume rm -f $$(docker volume ls -q) 2>/dev/null || true
	docker network prune -f
	docker system prune -a -f --volumes
