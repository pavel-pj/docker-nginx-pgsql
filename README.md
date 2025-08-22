original:
https://github.com/pavel-pj/docker-nginx-pgsql

#Dev version :

1. cp .env.example .env

2. sudo mkdir -p vendor
   sudo chown -R $USER:$USER vendor/

3. docker compose -f compose.dev.yaml exec workspace bash
          composer install

      