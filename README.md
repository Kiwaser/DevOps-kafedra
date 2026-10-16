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

4. Эндпоинты

## Всего их 3

| Сервис      | Адрес                         | Учётные данные        |
|-------------|-------------------------------|-----------------------|
| Приветствие | http://localhost/api/hello    |                       |
| Регистрация | http://localhost/api/register |                       |
| phpMyAdmin  | http://localhost:8080         | `root` / `rootsecret` |

5. Тестирование

Есть коллекция для Bruno скопированная из тестового репозитория