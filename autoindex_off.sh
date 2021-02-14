#!/bin/bash
docker stop my_image
docker run --rm --env AUTOINDEX=off --name my_image -dp 80:80 -dp 443:443 -it --rm my_image