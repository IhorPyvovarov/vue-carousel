#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'deployment gh-pages'
git push -f git@github.com:IhorPyvovarov/vue-carousel.git master:gh-pages

cd -