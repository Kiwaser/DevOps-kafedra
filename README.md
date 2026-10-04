# Выполнил: Токарев Егор группа 444

Окружение для разработки Laravel-приложения на базе Docker и Docker Compose.

## Стек

| Компонент   | Версия / образ                  | Назначение                         |
|-------------|---------------------------------|------------------------------------|
| Laravel     | 12 (PHP `^8.4`)                 | Само приложение                    |
| PHP-FPM     | `php:8.4-fpm-alpine` + Composer | Выполнение PHP-кода                |
| Nginx       | `nginx:alpine`                  | Прокси: Laravel (`:80`), phpMyAdmin (`:8080`) |
| MySQL       | `mysql:9`                       | База данных                        |
| phpMyAdmin  | `5.2.3-fpm-alpine`              | Веб-интерфейс для БД               |

В PHP-образ установлены расширения `pdo_mysql`, `zip`, `mbstring`, `gd`.

Перейдите в папку проекта:

   ```
   cd DevOps-kafedra
   ```

1. Создайте файл окружения:

   ```
   cp laravel/.env.example laravel/.env
   ```

2. Запустите контейнеры:

   ```
   cd Deploy/dev
   docker compose up -d
   ```

3. Выполните первичную настройку (установка зависимостей, генерация ключа, миграции):
   
   Сначала нужно выдать права в контейнер
   ```
   docker compose exec -u root php chown -R www-data:www-data /var/www/html
   ```
   Потом уже:
   ```
   chmod +x script.sh
   ./script.sh
   ```

   Скрипт выполняет три команды:

   ```
   docker compose exec php composer install
   docker compose exec php php artisan key:generate
   docker compose exec php php artisan migrate
   ```

4. Откройте приложение в браузере: http://localhost

Если открылась страница laravel то php отработал нормально

## Доступ к сервисам

| Сервис            | Адрес                         | Учётные данные                     |
|-------------------|-------------------------------|------------------------------------|
| Приложение        | http://localhost            | —                                  |
| phpMyAdmin        | http://localhost:8080       | `root` / `rootsecret`               |

Значения берутся из `laravel/.env` (переменные `DB_*`, `MYSQL_*`). Для любого окружения, кроме локального, обязательно смените пароли.


Альтернативный запуск с явным указанием env-файла:

```
docker compose --env-file ../../laravel/.env up -d --build
```