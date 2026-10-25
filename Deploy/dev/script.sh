#!/bin/sh
set -e

cp ../../laravel/.env.example ../../laravel/.env

docker compose up -d --wait --wait-timeout 360

docker compose exec php composer install

docker compose exec php php artisan key:generate

docker compose exec php php artisan migrate:fresh --seed