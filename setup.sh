#!/bin/bash
echo 'Installing dependencies'
echo 'Note: Rustup will not be automatically installed since it has a tendency to break inside of automated scripts.'

sudo apt install redis

echo 'Cloning Revolt'
git clone https://github.com/revoltchat/autumn
git clone https://github.com/revoltchat/january
git clone https://github.com/revoltchat/backend revolt-backend-selfhosted
git clone https://github.com/revoltchat/revite --recursive

cd revite
yarn
echo 'WORKAROUND: building revolt.js directly'
cd external/revolt.js
yarn
yarn build

echo 'Setup complete! Run launch.sh to run Revolt.'
