# Выполнил: Токарев Егор группа 444

Окружение для разработки Laravel-приложения на базе Docker и Docker Compose.

## Стек

| Компонент  | Версия / образ                  | Назначение              |
|------------|---------------------------------|-------------------------|
| Laravel    | 12 (PHP `^8.4`)                 | Само приложение         |
| PHP-FPM    | `php:8.4-fpm-alpine` + Composer | Выполнение PHP-кода     |
| Nginx      | `nginx:alpine`                  | Прокси: Laravel (`:80`) |
| PostgreSQL | `postgres:17.11-alpine3.24`     | База данных             |
| Pgadmin    | `dpage/pgadmin4:9.18.0`         | Веб-интерфейс для БД    |


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


3. Эндпоинты

## Всего их 3

| Сервис      | Адрес                         | Учётные данные                 |
|-------------|-------------------------------|--------------------------------|
| Приветствие | http://localhost/api/hello    |                                |
| Регистрация | http://localhost/api/register |                                |
| PgAdmin     | http://localhost:8080         | `admin@example.com` / `secret` |

4. Тестирование

Есть коллекция для Bruno скопированная из тестового репозитория