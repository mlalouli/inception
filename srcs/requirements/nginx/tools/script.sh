#!/bin/bash

yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/mlalouli.42.fr.key -out /etc/nginx/ssl/mlalouli.42.fr.crt
