set -e
git checkout guide
git pull
git checkout hist-quote
git pull
git checkout gh-pages
git pull

rm /tmp/docs-guide -rf
rm /tmp/docs-hist-quote -rf

git checkout guide
git pull
bundle exec middleman build --clean
cp build /tmp/docs-guide -R


git checkout hist-quote
git pull
bundle exec middleman build --clean
cp build /tmp/docs-hist-quote -R


git checkout gh-pages
rm hist-quote guide -rf

cp /tmp/docs-guide guide -R
cp /tmp/docs-hist-quote hist-quote -R

git add .
git commit -a -m "deploy"
git push

rm /tmp/docs-guide -rf
rm /tmp/docs-hist-quote -rf
