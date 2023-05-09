#!/bin/bash -eEu

set -o pipefail

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

pushd construct-hub
git restore \*
yarn install --check-files
popd
./patch.sh
pushd construct-hub
NODE_OPTIONS=--max-old-space-size=8192 npx projen build
