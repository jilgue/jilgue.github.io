# Git cheat sheet

- git co --track origin/branch branch
- git rebase master # ordena la historia de mi rama para que mis cambios siempre estén los primeros
- git commit --amend # permite cambiar el comentario del último commit

## Revertir un merge
- merge commit -> git revert --mainline 1 commit
- no merge commit -> git branch --contais commit -> git revert commit

- use --no-ff no fast-forward merge
- cuando se hace un force pushing todo el mundo tiene que tener su repo limpio para evitar conflictos
  - remove secret.md
  - git filter-branch --index-filter 'git rm --cached --ignore-unmatch secret.md' HEAD
    ignore-unmatch por si se incluyo en giignore
    - git filter-branch --tree-filter 'for i in `grep -rl c7fd595bf0cb8dfd1f12468b16cf2b6c`;do sed -i "s/c7fd595bf0cb8dfd1f12468b16cf2b6c/xxxxxxxxx/" $i;done' HEAD
  - git reflog expire --expire=now --all # forget about extended history, and use only the stored commit messages
  - git gc --prune=now # run the garbage collector and ensure all noncommitted changes are removed from local memory
    reflog permanently remove
  - git push origin --force --all
  - updating
    - cloning
    - git pull --rebase=preserve allow keep work locally

## git stash
- git stash
  - git stash --include-untracked
  - git stash "mesagge"
  - git stash list
  - git stash show stash@{0}
  - git stash apply stash@{0} # stash persist
  - git stash drop stash@{0} # clean stash
  - git stash pop
  - git stash pop stash@{0}
- git log --oneline
  - git log working..origin/broken
  - git log -S foo
  - git log -G regex
  - git log --after "Nov 10 2016"
  - git log --before "Nov 10 2016"
  - git log --reverse
  - git log --merges
  - git log --oneline --graph --decorate
- git blame file
- git bisect
  - git bisect
  - git bisect bad commit
  - git bisect good commit
  - git bisect bad
  - git bisect good
  - git bisect reset
- git pull origin/master === git fetch --all && git merge origin/master
- git clean -x # add ignore files
- git ls-files -v # lista todos los archivos y su estado
- git merge -s --strategy -X --strategy-option # algorithm that git use to decide how to perform a merge
  + strategy
    - recursive # default a single branch merge
    - octopus # default two o more branch
    - ours
    - subtree
  + options
    - ours
    - their
    - patience
    - ignore-all-space
- git push origin :refs/tags/v1.144.14
- git rev-parse 3.0.0
- git describe --tags --abbrev=0
- git cherry -v masterV2
- sacar cambios a otro repo
  - git co -b foundation-lab
  - git remote add foundation-lab git@gitlab.bitban.int:frontend/foundation-lab.git
  - git fetch --all
  - git filter-branch -f --prune-empty --subdirectory-filter sites/default/frontend/ foundation-lab
  - git push foundation-lab foundation-lab:master
- git log --no-merges mobileRD  --not $(git for-each-ref --format="%(refname)" refs/heads | grep -Fv refs/heads/mobileRD) te da los commits que solo existen en la rama mobileRD
- git tag 3.7.0 3.7.0 -f -m "Se añade a BB3HTTPHeaders la opción de enviar un código 204 No Content"
- git filter-branch -f --index-filter 'git revert "${GIT_COMMIT}"~1' masterAntesMerge40345..masterPruebas
- git reset --hard --mixed --merge d93808ad3d4ac7b879b55e06ec3dc8deb82dddf0
  - git push origin -f master
  - git pull --rebase=preserve
- git fetch --prune <remote> +refs/tags/*:refs/tags/*
- git merge servotic --allow-unrelated-histories

# Remove branches not on remote

`git branch -D $(git branch -v | grep "\[desaparecido\]" | cut -f 3 -d " ")`
