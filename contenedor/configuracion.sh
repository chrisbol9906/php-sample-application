#! /bin/sh

#conf db

docker exec -i db_node mysql -u root --password=samplepass -e "ALTER USER sampleuser IDENTIFIED WITH mysql_native_password BY 'samplepass';"

docker exec -i db_node sh -c 'exec mysql -u root --password=samplepass sample' < php-sample-application-master/sql/db.sql
