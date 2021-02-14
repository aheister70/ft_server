#!/bin/bash

# check if nginx already started, if yes make changes and reload, 
# if not (first attempt -> during building the container) just copy files

if (( $(ps -ef | grep -v grep | grep nginx | wc -l) > 0 ))
then
    if [ "$AUTOINDEX" = "off" ] ;
    then cp /tmp/nginx_off.conf /etc/nginx/sites-available/localhost ;
    else cp /tmp/nginx.conf /etc/nginx/sites-available/localhost ; fi
service nginx reload
else
    if [ "$AUTOINDEX" = "off" ] ;
    then cp /tmp/nginx_off.conf /etc/nginx/sites-available/localhost ;
    else cp /tmp/nginx.conf /etc/nginx/sites-available/localhost ; fi
fi