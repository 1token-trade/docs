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
