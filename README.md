original:
https://github.com/pavel-pj/docker-nginx-pgsql

#Dev version :

-make install
-make build-dev
-make up-dev

-docker compose -f compose.dev.yaml exec workspace bash
->insede containner :
-composer install
-npm install
-npm run dev


- (host) cp .env.example .env
- (host) sudo mkdir -p vendor
- (host)sudo chown -R $USER:$USER vendor/
-  
- (host) mkdir node_modules
- (host) sudo chown -R $USER:$USER node_modules/
- (host) chmod -R 775 node_modules/

- (host) chmod 775 public/
- (host) chown -R $USER:$USER public/

- (host) make build-dev
- (host) make up-dev
docker compose -f compose.dev.yaml exec workspace bash
- (docker) composer install
- (docker) npm run dev


      