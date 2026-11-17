#!/bin/sh
set -e

cp ../../laravel/.env.example ../../laravel/.env

docker compose up -d --wait --wait-timeout 360

docker compose exec backend composer install

docker compose exec backend php artisan key:generate

docker compose exec backend php artisan migrate:fresh --seed