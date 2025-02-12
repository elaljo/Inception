#!/bin/bash

sed -i 's/${DB_USER}/'"$DB_USER"'/g' database.sql
sed -i 's/${DB_PASS}/'"$DB_PASS"'/g' database.sql

service mariadb start
mysql < /database.sql