FROM    debian:bookworm

RUN     apt-get update && apt-get install -y mariadb-server

RUN     mkdir -p /var/run/mysqldir && chmod 777 /var/run/mysqldir

ARG     DB_NAME=${DB_NAME}
ARG     DB_USER=${DB_USER}
ARG     DB_PASS=${DB_PASS}

ENV     DB_NAME=${DB_NAME}
ENV     DB_USER=${DB_USER}
ENV     DB_PASS=${DB_PASS}

EXPOSE  3306

COPY    /conf/database.sql /database.sql

COPY    /tools/database.sh  /

RUN     chmod +x /database.sh
RUN     bash /database.sh

CMD [ "mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]