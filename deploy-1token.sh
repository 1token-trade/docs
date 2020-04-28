set -e
git checkout guide
git pull
git checkout hist-data
git pull
git checkout gh-pages
git pull

rm /tmp/docs-guide -rf
rm /tmp/docs-hist-data -rf

git checkout guide
git pull
bundle exec middleman build --clean
cp build /tmp/docs-guide -R


git checkout hist-data
git pull
bundle exec middleman build --clean
cp build /tmp/docs-hist-data -R


git checkout gh-pages
rm hist-data guide -rf

cp /tmp/docs-guide guide -R
cp /tmp/docs-hist-data hist-data -R

git add .
git commit -a -m "deploy"
git push
