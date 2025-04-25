#!/bin/bash
set -e

if [ "$1" == "setup" ]; then
  kamal setup
elif [ "$1" == "deploy" ]; then
  kamal deploy
elif [ "$1" == "env-push" ]; then
  kamal env push
else
  echo "Usage: ./deploy.sh [setup|deploy|env-push]"
  exit 1
fi
