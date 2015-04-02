#!/bin/bash

pip install -r requirements.txt 2>&1 >/dev/null || exit 1

pep8 foo bar || exit 1

# Build docs
rst2html5 help.rst help.html || exit 1
rm -rf html/
epydoc --config foo.conf || exit 1

rst2html5 index.rst index.html || exit 1
Z=$(grep -n "<body>" index.html | sed "s/:.*//")
tail --lines=+$((Z+1)) index.html > J.html
Z=$(grep -n "</body>" J.html | sed "s/:.*//")

N=$(grep -n "<h1 class=\"epydoc\">Module Hierarchy</h1>" html/module-tree.html | sed "s/:.*//")
head -$N html/module-tree.html > K.html
head -$((Z-1)) J.html >> K.html
tail --lines=+$((N+1)) html/module-tree.html >> K.html
mv K.html html/module-tree.html
rm -f J.html

# prepare a tarball
tar cfz ~/epydoc.tgz html/ || exit 1

# run doctests
python foo/__init__.py || exit 1

if [ "$1" == "-v" ]
then
    x-www-browser html/index.html
else
    # tell user how to view docs
    echo "x-www-browser html/index.html    # to view python docs"
fi
