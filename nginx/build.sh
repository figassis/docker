#!/bin/bash
clear
tag=`cut -d "=" -f2- <<< $(sed "2q;d" Dockerfile )`
docker build --rm -t figassis/nginx:$tag . && docker push figassis/nginx:$tag