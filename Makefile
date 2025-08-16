clear: 
	docker compose -f compose.prod.yaml down --remove-orphans
	docker system prune -f
	sudo systemctl restart docker
up:
	docker compose -f compose.prod.yaml up -d	
clear-log:
	sudo truncate -s 0 $(docker inspect --format='{{.LogPath}}' laravel-php-fpm-1)	
logs:
	docker logs laravel-php-fpm-1	