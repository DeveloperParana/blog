
#!/usr/bin/env bash
set -e # halt script on error

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
git add .
git commit -m "Deploy to GitHub Pages"
echo "git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1"
