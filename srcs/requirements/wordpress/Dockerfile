FROM    debian:bookworm

RUN     apt-get update && apt-get upgrade -y && apt-get install -y wget tar

RUN     apt-get install -y php8.2 \
        php8.2-fpm \
        php8.2-mysql \
        mariadb-client 

RUN     apt install -y curl && \
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
        chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN     wp core download --path=/var/www/ --allow-root

COPY    tools/wp_config.sh /

RUN     chmod +x /wp_config.sh

RUN     sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/8.2/fpm/pool.d/www.conf

ENTRYPOINT  ["bash", "/wp_config.sh"]