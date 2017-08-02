#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Address (-a) or fuel type (-f) arguments missing'
    exit 1
fi

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -a|--ADDRESS)
    ADDRESS="$2"
    echo ${ADDRESS}
    shift # past argument
    ;;
    -f|--FUEL_TYPE)
    FUEL_TYPE="$2"
    echo ${FUEL_TYPE}
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

cd /sumo/gas-scraper/
docker-compose run --rm --entrypoint="node index.js -a='${ADDRESS}' -f=${FUEL_TYPE}" scraper
