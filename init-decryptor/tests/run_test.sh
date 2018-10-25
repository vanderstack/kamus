#!/usr/bin/env bash

set -e

echo "starting wiremock"

docker-compose up -d --build wiremock

docker-compose build decryptor

echo "running decryptor"

OUTPUT_FORMAT=json docker-compose run decryptor

echo "comparing files"

diff -q out.json expected.json

echo "running decryptor"

OUTPUT_FORMAT=json docker-compose run decryptor

echo "comparing files"

diff -q out.json expected.json