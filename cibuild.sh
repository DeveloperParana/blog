
#!/usr/bin/env bash
set -e # halt script on error

echo 'Testing travis...'
bundle exec travis-lint
bundle exec jekyll build
bundle exec htmlproof ./_site --disable-external

## config
#echo "Git config"
#git config --global user.email "blog@devparana.org"
#git config --global user.name "Blog DevParana"

# deploy
#echo "Deploy"
#git init
#git add --all
#git commit -m "Deploy to GitHub Pages"
#git push --force --quiet "https://${GH_TOKEN}@github.com/DeveloperParana/blog.git" master:gh-pages
