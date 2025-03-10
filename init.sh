#!/bin/bash

until mysql -h db -u root -e "SELECT 1"; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done


mysql -h db -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

cd /var/www || exit
php bin/console doctrine:migrations:migrate --no-interaction