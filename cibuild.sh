
#!/usr/bin/env bash
set -e # halt script on error

echo "Remove assets..."
rm -Rf assets/*

echo "Gulp..."
gulp without-jekyll

echo 'Testing travis...'
bundle exec travis-lint
bundle exec jekyll build
bundle exec htmlproof ./_site

# config
echo "Git config"
git config --global user.email "blog@devparana.org"
git config --global user.name "Blog DevParana"

# deploy
echo "Deploy"
git init
git add --all
git status
git commit -m "Deploy to GitHub Pages"
git push --force "https://${GH_TOKEN}@github.com/DeveloperParana/blog.git" gh-pages
