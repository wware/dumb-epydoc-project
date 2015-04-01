#!/bin/sh

pip install -r requirements.txt
rst2html help.rst help.html
rm -rf html/
epydoc --config foo.conf

rst2html index.rst index.html
Z=$(grep -n "<body>" index.html | sed "s/:.*//")
tail --lines=+$((Z+1)) index.html > J.html
Z=$(grep -n "</body>" J.html | sed "s/:.*//")

N=$(grep -n "<h1 class=\"epydoc\">Module Hierarchy</h1>" html/module-tree.html | sed "s/:.*//")
head -$N html/module-tree.html > K.html
head -$((Z-1)) J.html >> K.html
tail --lines=+$((N+1)) html/module-tree.html >> K.html
mv K.html html/module-tree.html
rm -f J.html

x-www-browser html/index.html
tar cfz ~/epydoc.tgz html/
