#!/bin/bash

rm /etc/nginx/nginx.conf
if ls /etc/nginx/ssl/*.crt &> /dev/null; then
    echo "using ssl"
    ln -s /etc/nginx/nginx_ssl.conf /etc/nginx/nginx.conf
else
    echo "not using ssl"
    ln -s /etc/nginx/nginx_nossl.conf /etc/nginx/nginx.conf
fi