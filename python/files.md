Files
=====

```python
            p = re.compile(r"^inventory.*")
            dir_inventories = list(filter(lambda x: p.match(x), listdir(argv[2])))
            for dir_inventory in dir_inventories:
                p = re.compile(r".*\.ini$")
                inventories = list(filter(lambda x: p.match(x), listdir(dir_inventory)))
                print(inventories)

# glob
           inventories = glob.glob(argv[2] + "/inventory*/*.ini")
```
