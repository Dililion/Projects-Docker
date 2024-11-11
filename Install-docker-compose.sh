#!/bin/bash

# Обновление системы
sudo apt update
sudo apt upgrade -y

# Установка Docker
sudo apt install docker.io -y

# Установка Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Проверка установки Docker Compose
docker-compose --version

#  Переходим в директорию с docker-compose.yml
cd /путь/к/директории/с/docker-compose.yml

# Запуск Docker Compose
docker-compose up -d
