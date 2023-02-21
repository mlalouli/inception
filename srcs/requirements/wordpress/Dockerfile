FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install curl -y

RUN apt-get install -y php-fpm php-mysql 

COPY ./requirements/wordpress/tools/script.sh /tmp
RUN chmod +x /tmp/script.sh

# CMD tail -f
CMD ["./tmp/script.sh"]
