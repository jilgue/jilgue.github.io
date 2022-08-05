Finally, you can separate options from a list of arguments via the “bare double dash”
convention. For instance, use the double dash to contrast the control portion of the
command line from a list of operands, such as filenames.
$ git diff -w master origin -- tools/Makefile
You may need to use the double dash to separate and explicitly identify filenames if
they might otherwise be mistaken for another part of the command. For example, if
you happened to have both a file and a tag named main.c, then you will get different
behavior:
# Checkout the tag named "main.c"
$ git checkout main.c
# Checkout the file named "main.c"
$ git checkout -- main.c
