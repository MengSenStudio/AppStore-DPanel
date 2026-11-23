#!/bin/bash

if [ -f .env ]; then
  source .env

  CURRENT_DIR=$(pwd)
  sed -i '/^ENV_FILE=/d' .env
  sed -i '/^GLOBAL_ENV_FILE=/d' .env
  echo "ENV_FILE=${CURRENT_DIR}/.env" >> .env
  echo "GLOBAL_ENV_FILE=${CURRENT_DIR}/envs/global.env" >> .env

  mkdir -p "${RADICALE_ROOT_PATH}/config"
  mkdir -p "${RADICALE_ROOT_PATH}/data"

  # setup-1 initialize configuration file
  if [ ! -f "${RADICALE_ROOT_PATH}/config/config" ]; then
    cp ./config/config "${RADICALE_ROOT_PATH}/config/config"
  fi

  # setup-2 initialize htpasswd user file
  if [ ! -f "${RADICALE_ROOT_PATH}/config/users" ]; then
    echo "${RADICALE_AUTH_USER}:${RADICALE_AUTH_PASSWORD}" > "${RADICALE_ROOT_PATH}/config/users"
    chmod 600 "${RADICALE_ROOT_PATH}/config/users"
  fi

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
