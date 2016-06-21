#!/usr/bin/env bash
set -e

mkdir -p bin
mkdir -p tmp
if [ ! -f ./bin/lein ]; then
  echo "Installing local lein..."
  (curl --version > /dev/null) || ((brew --version > /dev/null) && (brew install curl > /dev/null))
  (curl --version > /dev/null) || ((apt-get --version > /dev/null) && (apt-get install curl -y > /dev/null))
  curl --silent "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein" > bin/lein
fi
chmod +x bin/lein
./bin/lein &> /dev/null
./bin/lein deps
