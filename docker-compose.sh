#!/bin/bash

DOCKER_HOST_IP=$(ipconfig getifaddr en0 || ipconfig getifaddr en1)
export DOCKER_HOST_IP

docker-compose up -d
