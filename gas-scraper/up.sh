#!/bin/bash

cd /sumo/gas-scraper/
docker-compose down
docker-compose pull
docker-compose up -d mongo chrome
