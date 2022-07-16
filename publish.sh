#!/bin/bash
set -eo pipefail

cp js/gs.mjs dist/
cp js/browser.js dist/
cp package.json dist/
cp README.md dist/
cp LICENSE dist/

cd dist

if [[ "$LIVE" != "1" ]]
then
  EXTRA_FLAGS="--dry-run"
fi

npm publish \
  --access public \
  $EXTRA_FLAGS
