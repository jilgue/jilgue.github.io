Doom Emacs
==========

Instalamos emacs 27:

```bash
$ pikaur -S emacs27-git
# pacman -S clang tar fd
```

Instalamos doom:
```bash
$ git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
$ ~/.emacs.d/bin/doom install
```


VueJS
-----
```bash
# npm install -g vue-language-server
```

PHP
---
https://phpactor.github.io/phpactor/standalone.html





Before you doom yourself, there are a few things you should know:

1. Whenever you edit your doom! block in ~/.doom.d/init.el or modify your
   modules, run:

     bin/doom refresh

   This will ensure all needed packages are installed, all orphaned packages are
   removed, and your autoloads files are up to date. This is important! If you
   forget to do this you will get errors!

2. If something inexplicably goes wrong, try `bin/doom doctor`

   This will diagnose common issues with your environment and setup, and may
   give you clues about what is wrong.

3. Use `bin/doom upgrade` to update Doom. Doing it any other way may require
   additional work. When in doubt, run `bin/doom sync`.

4. Check out `bin/doom help` to see what else `bin/doom` can do (and it is
   recommended you add ~/.emacs.d/bin to your PATH).

5. You can find Doom's documentation via `M-x doom/help` or `SPC h D`.

Have fun!


The bin/doom utility

This utility is your new best friend. It won’t spot you a beer, but it’ll shoulder much of the work associated with managing and maintaining your Doom Emacs configuration, and then some. Not least of which is installation of and updating Doom and your installed packages.

It exposes a variety of commands. bin/doom help will list them all, but here is a summary of the most important ones:

    bin/doom sync: This synchronizes your config with Doom Emacs. It ensures that needed packages are installed, orphaned packages are removed and necessary metadata correctly generated. Run this whenever you modify your doom! block or packages.el file.
    bin/doom upgrade: Updates Doom Emacs (if available) and all its packages.
    bin/doom env: (Re)generates an “envvar file”, which is a snapshot of your shell environment that Doom loads at startup. If your app launcher or OS launches Emacs in the wrong environment you will need this. **This is required for GUI Emacs users on MacOS.**
    bin/doom doctor: If Doom misbehaves, the doc will diagnose common issues with your installation, system and environment.
    bin/doom purge: Over time, the repositories for Doom’s plugins will accumulate. Run this command from time to time to delete old, orphaned packages, and with the -g switch to compact existing package repos.

Use bin/doom help to see an overview of the available commands that bin/doom provides, and bin/doom help COMMAND to display documentation for a particular COMMAND.

    I recommend you add ~/.emacs.d/bin to your PATH so you can call doom directly and from anywhere. Accomplish this by adding this to your .bashrc or .zshrc file:

    ~export PATH=”$HOME/.emacs.d/bin:$PATH”~

