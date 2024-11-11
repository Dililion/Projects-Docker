#!/bin/bash

# Проверяем наличие root-прав
if [[ $EUID -ne 0 ]]; then
  echo "Необходимо запустить скрипт от имени root!"
  exit 1
fi

# Проверка наличия Docker
if ! command -v docker &> /dev/null; then
  echo "Установка Docker..."
  wget -O - https://get.docker.com | bash
  echo "Docker установлен."
fi

# Проверка наличия Docker Compose
if ! command -v docker-compose &> /dev/null; then
  echo "Установка Docker Compose..."
  sudo curl -L "https://github.com/docker/compose/releases/download/v2.10.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  echo "Docker Compose установлен."
fi

# Проверка установки
echo "Проверка установки Docker и Docker Compose..."
docker --version
docker-compose --version

echo "Установка завершена!"
