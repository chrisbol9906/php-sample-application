#! /bin/sh

#conf db

docker exec -i db_node mysql -u root --password=samplepass -e "ALTER USER sampleuser IDENTIFIED WITH mysql_native_password BY 'samplepass';"
docker exec -i db_node sh -c 'exec mysql -u root --password=samplepass sample' < php-sample-application-master/sql/db.sql

#conf app

docker exec -i app_node apt install zip unzip -y
docker exec -i app_node chown -R www-data:www-data /var/www/php-sample-application-master
docker exec -i app_node cd && make
docker exec -i app_node systemctl restart apache2
