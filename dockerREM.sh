#!/usr/bin/env bash

set -euo pipefail

# Define Colors for output
magenta='\e[0;35m'
green='\e[0;32m'
red='\e[0;31m'
nc='\e[0m'

# Functions

## Main Banner
banner() {
    echo -e "${magenta}=====================${nc}"
    echo -e "${magenta}Docker Remove Script${nc}"
    echo -e "${magenta}1. Stop and remove all running containers${nc}"
    echo -e "${magenta}2. Remove all Docker images${nc}"
    echo -e "${magenta}3. Remove all Docker volumes${nc}"
    echo -e "${magenta}4. Remove all Docker networks${nc}"
    echo -e "${magenta}5. Prune all unused Docker resources ${nc}"
    echo -e "${magenta}=====================${nc}"
    echo ""
}
dr() {
    # Stop and remove all running containers
    CONTAINERS=$(docker ps -aq)
    if [ -n "$CONTAINERS" ]; then
        echo -e "${magenta}Removing containers...${nc}"
        docker stop $CONTAINERS
        docker rm $CONTAINERS
        echo -e "${green}Containers removed.${nc}"
    else
        echo -e "${red}No containers found.${nc}"
    fi

    # Remove all Docker images
    IMAGES=$(docker images -q)
    if [ -n "$IMAGES" ]; then
        echo -e "${magenta}Removing images...${nc}"
        docker rmi $IMAGES
        echo -e "${green}Images removed.${nc}"
    else
        echo -e "${red}No images found.${nc}"
    fi

    # Remove all Docker volumes
    VOLUMES=$(docker volume ls -q)
    if [ -n "$VOLUMES" ]; then
        echo -e "${magenta}Removing volumes...${nc}"
        docker volume rm $VOLUMES
        echo -e "${green}Volumes removed.${nc}"
    else
        echo -e "${red}No volumes found.${nc}"
    fi

    # Remove all Docker networks
    NETWORKS=$(docker network ls -q)
    if [ -n "$NETWORKS" ]; then
        echo -e "${magenta}Removing networks...${nc}"
        docker network rm $NETWORKS
        echo -e "${green}Networks removed.${nc}"
    else
        echo -e "${red}No networks found.${nc}"
    fi

    # Prune all unused Docker resources
    docker system prune -af
    echo -e "${green}System pruned.${nc}"
}

# xyizko banner

xo() {
    url="https://snips.sh/f/ZuwtQ3Pk0x?r=1"
    curl $url
}

# Execute functions
xo
banner
dr
