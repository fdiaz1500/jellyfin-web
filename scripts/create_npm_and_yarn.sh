#!/usr/bin/env bash

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn
node --version
npm --version
sudo apt-get install nodejs
sudo apt-get install npm
sudo npm install --global gulp-cli
cd jellyfin-web/
yarn install
yarn serve
#yarn build:developmnet
#yarn build:standalone
#cd dist/
#python3 -m http.server 
