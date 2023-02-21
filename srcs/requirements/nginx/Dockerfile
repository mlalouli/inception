FROM debian:buster

RUN	apt-get update && apt-get upgrade -y && apt-get install nginx -y && apt-get -y install openssl

RUN mkdir -p /etc/nginx/ssl

COPY ./requirements/nginx/tools/script.sh /etc/nginx/ssl

RUN chmod +x /etc/nginx/ssl/script.sh

RUN ./etc/nginx/ssl/script.sh

# CMD ["sleep" ,"100000000"]
CMD ["nginx", "-g", "daemon off;"]