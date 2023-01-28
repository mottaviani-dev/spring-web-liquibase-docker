#!/bin/bash

docker build -t my-mysql .
docker run -d --name my-mysql -p 3306:3306 my-mysql
