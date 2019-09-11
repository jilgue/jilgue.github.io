Jupyter
======
Install
-------
```bash
$ virtualenv jupyter
$ source jupyter/bin/activate
$ pip install jupyter bash_kernel jupyterlab
$ python -m bash_kernel.install
```

Start
-----
```bash
$ jupyter-lab
```

Start as server:
```bash
$ jupyter notebook --generate-config
```

Edit `.jupyter/jupyter_notebook_config.py` with:
```ini
c.NotebookApp.ip = '*'
c.NotebookApp.allow_remote_access = True
```

And start the server:
```bash
$ jupyter-lab
```

Export
------
```bash
$ jupyter nbconvert README.ipynb --to markdown --output README.md
```

### Export to pdf

Install requisites:
```bash
# pacman -S asciidoc asciidoctor pandoc
$ gem install asciidoctor-pdf --pre
$ gem install rouge
$ gem install pygments.rb
$ gem install coderay
```

Export to asciidoc
```bash
$ jupyter nbconvert README.ipynb --to=asciidoc --output README.asciidoc
```

Export asciidoc to pdf with custom theme
```bash
$ export BASE=~/projects/sistemas/plantillas/.asciidoc
$ asciidoctor -a lang=es -r asciidoctor-pdf -a pdf-stylesdir="$BASE"/themes -a pdf-style=custom -a pdf-fontsdir="$BASE"/fonts -b pdf README.asciidoc
```

### Using LaTex

Template: https://michaelgoerz.net/notes/custom-template-for-converting-jupyter-notebooks-to-latex.html

```bash
$ jupyter nbconvert --to=latex --template=./revtex.tplx README.ipynb
$ pdflatex README.tex
```

Use Markdown cell with LaTex commands in Jupyter Notebook, one command per cell.

LaTex
-----

    \tableofcontents

    \pagebreak

### RevTex

https://journals.aps.org/revtex
https://osl.ugr.es/CTAN/macros/latex/contrib/revtex/doc/auguide/summary4-2.pdf
https://osl.ugr.es/CTAN/macros/latex/contrib/revtex/doc/auguide/auguide4-2.pdf


Shortcuts
---------

* Insert cell above currently selected cell -> **A**

* Insert cell below currently selected cell -> **B**

* Copy cell currently selected cell -> **C**

* Cut cell currently selected cell -> **X**

* Paste cell currently selected cell -> **V**

* Delete cell currently selected cell -> **dd**

* Change cell type of currently selected cell -> **M (Markdown)** / **Y (Code)**

* Switch currently selected cell to edit mode -> **Enter**

* Select multiple cells -> **Shift + up/down**

* Execute cell (run code) -> **shift + enter**

https://medium.com/@rrfd/jupyter-notebook-shortcuts-tips-and-tricks-top-nbextensions-bring-order-to-your-notebooks-pt-1-b58f270963f9
https://www.dataquest.io/blog/jupyter-notebook-tips-tricks-shortcuts/
