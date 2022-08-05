<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Getting started](#getting-started)
  - [Guardar cambios en Git](#guardar-cambios-en-git)
    - [Inicializar repositorio vacío](#inicializar-repositorio-vac%C3%ADo)
    - [Pasos para guardar cambios en Git](#pasos-para-guardar-cambios-en-git)
  - [Borrar / mover fichero](#borrar--mover-fichero)
  - [Ver histórico](#ver-hist%C3%B3rico)
  - [Configuración](#configuraci%C3%B3n)
  - [Alias](#alias)
  - [Uso de remotos](#uso-de-remotos)
    - [Crear un repositorio remoto en local](#crear-un-repositorio-remoto-en-local)
    - [Añadir remoto](#a%C3%B1adir-remoto)
    - [Trabajar con remoto push fetch pull](#trabajar-con-remoto-push-fetch-pull)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Getting started
===============
Vamos a describir los pasos básicos para poder usar Git.

Guardar cambios en Git
----------------------
### Inicializar repositorio vacío

```shell script
$ cd /tmp/
$ mkdir my-repo
$ cd my-repo
$ git init
Initialized empty Git repository in /tmp/my-repo/.git/
```

### Pasos para guardar cambios en Git
```shell script
$ git status
On branch master

Initial commit

nothing to commit (create/copy files and use "git add" to track)
```

```shell script
$ touch README.md
$ git status
On branch master

Initial commit

Untracked files:
  (use "git add <file>..." to include in what will be committed)

    README.md

nothing added to commit but untracked files present (use "git add" to track)
```

```shell script
$ git add README.md
$ git status
On branch master

Initial commit

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

    new file:   README.md
```

```shell script
$ git commit -m "Initial"

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: empty ident name (for <vagrant@ubuntu-xenial.(none)>) not allowed
```

```shell script
$ git config --global user.email "you@example.com"
$ git config --global user.name "Your Name"
```

```shell script
$ git commit -m "Initial"
[master (root-commit) b887f4c] Initial
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 README.md

$ git status
On branch master
nothing to commit, working directory clean
```

Borrar / mover fichero
----------------------
```shell script
$ rm README.md
$ git add .
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    deleted:    README.md
```

```shell script
$ git rm README.md
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    deleted:    README.md
```

```shell script
$ mv README.md README-new.md
$ git add .
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    renamed:    README.md -> README-new.md
```

```shell script
$ git mv README.md README-new.md
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    renamed:    README.md -> README-new.md
```

Ver histórico
-------------

```shell script
$ git log
commit b887f4c9d600dba6e76241d09513cbec8ccf7039
Author: Your Name <you@example.com>
Date:   Fri Aug 9 11:06:25 2019 +0000

    Initial
```

```shell script
$ git show
commit b887f4c9d600dba6e76241d09513cbec8ccf7039
Author: Your Name <you@example.com>
Date:   Fri Aug 9 11:06:25 2019 +0000

    Initial

diff --git a/README.md b/README.md
new file mode 100644
index 0000000..e69de29
```

Configuración
-------------
Hay tres niveles de configuración:
* repositorio:
  * se guarda en .git/config
  * opción por defecto
  * se usa con la opción --file
  * más alta precedencia
* usuario:
  * se guarda en ~/.gitconfig
  * común a todos los repositorios del usuario
  * se usa con la opción --global
* sistema:
  * se guarda en /etc/gitconfig
  * común a todo el sistema
  * se usa con la opción --system

```shell script
$ git config --global user.name "Name"
$ git config --global user.email "name@example.com"
$ cat ~/.gitconfig
[user]
    email = name@example.com
    name = Name
```

```shell script
$ git config user.email "other-name@example.com"
$ git config -l
user.email=you@example.com
user.name=Your Name
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
user.email=other-name@example.com
$ cat .git/config
[core]
    repositoryformatversion = 0
    filemode = true
    bare = false
    logallrefupdates = true
[user]
    email = other-name@example.com
```

Alias
-----
Podemos tener configurado alias para hacernos más fácil el día a día:

```shell script
$ cat ~/.gitconfig

[alias]
	br = branch
	st = status
	d = diff
	dc = diff --cached
	cm = commit --message
	co = checkout
```

Uso de remotos
--------------
### Crear un repositorio remoto en local

```shell script
$ mkdir my-repo-server
$ cd my-repo-server
$ git init --bare
$ ls
branches  config  description  HEAD  hooks  info  objects  refs
```

### Añadir remoto
```shell script
$ git clone file:///tmp/my-repo-server my-repo-clone
Cloning into 'my-repo-clone'...
warning: You appear to have cloned an empty repository.
Checking connectivity... done.
```

```shell script
my-repo$ git remote add origin file:///tmp/my-repo-server
my-repo$ git remote -v
origin    file:///tmp/my-repo-server (fetch)
origin    file:///tmp/my-repo-server (push)
```

### Trabajar con remoto push fetch pull
```shell script
my-repo$ git push origin master
Counting objects: 3, done.
Writing objects: 100% (3/3), 210 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To file:///tmp/my-repo-server
 * [new branch]      master -> master
```

```shell script
my-repo-clone$ git fetch --all
Fetching origin
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
From file:///tmp/my-repo-server
 * [new branch]      master     -> origin/master
```

```shell script
my-repo-clone$ git pull
my-repo-clone$ git log
commit b887f4c9d600dba6e76241d09513cbec8ccf7039
Author: Your Name <you@example.com>
Date:   Fri Aug 9 11:06:25 2019 +0000

    Initial
```

```shell script
$ mkdir my-repo-2
$ cd my-repo-2
my-repo-2$ git init
Initialized empty Git repository in /tmp/my-repo-2/.git/
my-repo-2$ git remote add origin file:///tmp/my-repo-server
my-repo-2$ git fetch --all
Fetching origin
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
From file:///tmp/my-repo-server
 * [new branch]      master     -> origin/master
my-repo-2$ git log
fatal: your current branch 'master' does not have any commits yet
my-repo-2$ git pull
There is no tracking information for the current branch.
Please specify which branch you want to merge with.
See git-pull(1) for details.

    git pull <remote> <branch>

If you wish to set tracking information for this branch you can do so with:

    git branch --set-upstream-to=origin/<branch> master
my-repo-2$ git pull origin master
From file:///tmp/my-repo-server
 * branch            master     -> FETCH_HEAD
```

```shell script
$ mkdir my-repo-3
$ cd my-repo-3
my-repo-3$ git init
Initialized empty Git repository in /tmp/my-repo-3/.git/
my-repo-3$ git remote add origin file:///tmp/my-repo-server
my-repo-3$ git pull origin master
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
From file:///tmp/my-repo-server
 * branch            master     -> FETCH_HEAD
 * [new branch]      master     -> origin/master
my-repo-3$ git log
commit b887f4c9d600dba6e76241d09513cbec8ccf7039
Author: Your Name <you@example.com>
Date:   Fri Aug 9 11:06:25 2019 +0000

    Initial
```