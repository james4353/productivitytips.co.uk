$sourceLocation = "/Users/volkan/MyHome/Projects/Git/ulrich-codecommit/productivitytips/src/productivitytips.co.uk/jekyll-texture"
$ghPagesPath = "/Users/volkan/MyHome/Projects/Git/github-ulrich/productivitytips.co.uk"

Set-Location $sourceLocation
bundle exec jekyll build
Remove-Item –Path $ghPagesPath/* –Recurse
Copy-Item $sourceLocation/_site/* $ghPagesPath/ -Recurse -Force
Set-Location $ghPagesPath
git checkout -b master
git add .
git commit -m "Publish"
git push -u origin master
Set-Location $sourceLocation