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

Export
------
```bash
$ jupyter nbconvert README.ipynb --to markdown --output README.md
```

Shortcuts
---------

* Insert cell above currently selected cell -> **A**

* Insert cell below currently selected cell -> **B**

* Delete cell currently selected cell -> **dd**

* Change cell type of currently selected cell -> **M (Markdown)** / **Y (Code)**

* Switch currently selected cell to edit mode -> **Enter**

* Select multiple cells -> **Shift + up/down**

* Execute cell (run code) -> **shift + enter**

https://medium.com/@rrfd/jupyter-notebook-shortcuts-tips-and-tricks-top-nbextensions-bring-order-to-your-notebooks-pt-1-b58f270963f9
