#!/usr/bin/env bash

set -e

host="$1"
shift
cmd="$@"

# Check to see if the MySQL container is ready for connections
until mysql -h "$host" -u "$DB_USERNAME" -p"$DB_PASSWORD" -e ";"; do
    echo "Containers not ready yet, retrying..."
    sleep 1
done

# If the database already has tables then the project is probably already set up
if [[ $(echo -n `mysql -h db -u $DB_USERNAME -p$DB_PASSWORD -sse "SELECT count(*) FROM information_schema.tables WHERE table_schema='app';"`) -gt 0 ]]; then
    echo "Project already set up..."

    # Continue to exec the standard Docker commands
    exec $cmd
    exit 0
fi

echo "Containers are ready, running set up commands..."

# Install composer
composer install

# Warm the cache
php artisan config:cache

# Run migrations
php artisan migrate

echo "Finished set up..."

# Continue to exec the standard Docker commands
exec $cmd