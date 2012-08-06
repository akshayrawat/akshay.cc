bundle exec middleman build

mv build /tmp/

git checkout gh-pages
git rm -rf .
cp -r /tmp/build/* .
git add .
git commit -m "Update site"

rm -rf /tmp/build

git push
git checkout master
