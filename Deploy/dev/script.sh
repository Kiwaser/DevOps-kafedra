#!/bin/sh
set -e

# Ждём, пока все контейнеры станут healthy (pgsql, pgadmin)
docker compose up -d --wait --wait-timeout 360

docker compose exec php composer install

docker compose exec php php artisan key:generate

docker compose exec php php artisan migrate:fresh --seed