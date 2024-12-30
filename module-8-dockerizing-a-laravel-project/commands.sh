docker compose run --rm composer create-project --prefer-dist laravel/laravel .

docker compose up -d server mysql php --build

docker compose run --rm artisan migrate

docker compose run --rm artisan view:cache