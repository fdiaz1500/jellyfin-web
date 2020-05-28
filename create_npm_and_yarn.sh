#!/usr/bin/env bash

curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn nodejs
sudo npm install --global gulp-cli
yarn install
yarn serve
#yarn build:developmnet
#yarn build:standalone
#cd dist/
#python3 -m http.server 
