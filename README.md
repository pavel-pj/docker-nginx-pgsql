original:
https://github.com/pavel-pj/docker-nginx-pgsql

#Dev version :

- (host) cp .env.example .env
- (host) sudo mkdir -p vendor
- (host)sudo chown -R $USER:$USER vendor/
- docker compose -f compose.dev.yaml exec workspace bash
- (docker) composer install
- (host) mkdir node_modules
- (host) sudo chown -R $USER:$USER node_modules/
- (host) chmod -R 775 node_modules/

- (host) chmod 775 public/
- (host) chown -R $USER:$USER public/

- (host) make build-dev
- (host) make up-dev
- (docker) npm run dev


      