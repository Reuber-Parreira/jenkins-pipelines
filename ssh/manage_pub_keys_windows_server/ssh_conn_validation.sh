#!/usr/bin/env bash

# Create .ssh dir if not exists
if [ ! -d ~/.ssh ]; then
  mkdir ~/.ssh
  chmod 0700 ~/.ssh
  echo "Directory ~/.ssh didin't exist. It was created!"
else
  echo "Directory ~/.ssh already exist!"
fi

# Create known_hosts dir if not exists
if [ ! -f ~/.ssh/known_hosts ]; then
  touch ~/.ssh/known_hosts
  echo "Created file ~/.ssh/known_hosts!"
else
  echo "File ~/.ssh/known_hosts already exist!"
fi

_KEY_SCAN="$(ssh-keyscan -t rsa ${_GENDATASET_SERVER_ADDRESS})"
_KNOWN_HOSTS=$(cat ~/.ssh/known_hosts)

# Add key scan to known_hosts if not exists
if [[ ! "${_KNOWN_HOSTS}" == *"${_KEY_SCAN}"* ]] || [[ -z "${_KNOWN_HOSTS}" ]]; then
  echo "${_KEY_SCAN}" >> ~/.ssh/known_hosts
  echo "Address added to known_hosts!"
else
  echo "Host address already known"
fi

ssh ${_GENDATASET_SERVER_USERNAME}@${_GENDATASET_SERVER_ADDRESS} "exit"