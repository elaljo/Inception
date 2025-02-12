FROM    debian:bookworm

RUN     apt-get update && apt-get install -y nginx openssl vim curl

RUN     mkdir -p /etc/nginx/ssl

RUN     openssl req -x509 -nodes \
        -out /etc/nginx/ssl/moelalj.42.fr.crt \
        -keyout /etc/nginx/ssl/moelalj.42.fr.key \
        -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=moelalj.42.fr/UID=moelalj"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY tools/script.sh /script.sh

RUN chmod +x /script.sh

EXPOSE 443

ENTRYPOINT [ "bash" , "/script.sh" ]

CMD ["nginx"]