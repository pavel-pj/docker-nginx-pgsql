.PHONY: start stop logs renew clean clean-all rebuild

build:
	docker compose -f compose.prod.yaml build
rebuild:
	docker compose -f compose.prod.yaml down
	docker compose -f compose.prod.yaml build --no-cache
	docker compose -f compose.prod.yaml up -d
up:
	docker compose -f compose.prod.yaml up -d
down:
	sudo docker compose -f compose.prod.yaml down
clear:
	docker compose -f compose.prod.yaml down --remove-orphans
	docker system prune -f
	sudo systemctl restart docker

clean-all:
# Stop all containers
	-docker stop $$(docker ps -aq) 2>/dev/null
	# Remove all containers
	-docker rm $$(docker ps -aq) 2>/dev/null
	# Remove all images
	-docker rmi -f $$(docker images -aq) 2>/dev/null
	# Remove all volumes
	-docker volume rm $$(docker volume ls -q) 2>/dev/null
	# Remove all networks (except built-in)
	-docker network rm $$(docker network ls -q | grep -v 'bridge\|host\|none') 2>/dev/null
	# Clean system
	docker system prune -a --volumes --force
	docker builder prune --all --force



