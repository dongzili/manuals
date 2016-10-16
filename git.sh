git add *
git rm ._*.pdf
#git rm --cached file1.txt
git commit -m "10.15 manuals"
git remote add 10.15 https://github.com/fleaf5/manuals.git
git push -u 10.15 master
