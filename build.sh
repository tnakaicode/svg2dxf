#!/bin/bash

set -e

VERSION=$1

if [ -z "${VERSION}" ]; then
    echo "Need to specify version" 
    exit 1
fi

git reset --hard HEAD && git checkout master && git pull
git branch -D release || true
git checkout -b release || true
echo "version = '${VERSION}'" > src/version.py


docker-build randyp/svg-to-dxf ${VERSION}
./push


git commit -am 'version' && git tag -a "${VERSION}" -m "${VERSION}" && git checkout master && git push --tags

