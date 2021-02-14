#!/bin/bash
docker build -t my_image .
docker run --rm --name my_image -dp 80:80 -dp 443:443 -it --rm my_image