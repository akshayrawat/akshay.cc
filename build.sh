bundle exec middleman build

mv build /tmp/
cp CNAME /tmp/build/

git checkout gh-pages
git rm -rf .
cp -r /tmp/build/* .
git commit -a -m "Update site"

rm -rf /tmp/build
