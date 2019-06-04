#!/usr/bin/env bash

# Bring down containers including volumes
docker-compose down -v

# Remove various cache files
find ./storage/framework/cache ! -name '.gitignore' -type f -exec rm -f {} +
find ./storage/framework/cache/data ! -name '.gitignore' -type f -exec rm -f {} +
find ./storage/framework/sessions ! -name '.gitignore' -type f -exec rm -f {} +
find ./storage/framework/views ! -name '.gitignore' -type f -exec rm -f {} +
find ./storage/logs ! -name '.gitignore' -type f -exec rm -f {} +

# Remove vendors
rm -rf ./vendor
