I want to do a little project with Epydoc just to get familiar with it.
Something not too labor-intensive, but to get an idea what it can do.

- `Epydoc usage`_
- `Docstring conventions`_
- `Annotating code for epydoc`_

.. _`Epydoc usage`: http://epydoc.sourceforge.net/manual-usage.html
.. _`Docstring conventions`: http://epydoc.sourceforge.net/manual-docstring.html
.. _`Annotating code for epydoc`: http://epydoc.sourceforge.net/manual-epytext.html

The version of RST used in epydoc's docstrings is `different`_ from the
version used in `this file`_, because this file is built to HTML using
rst2html. The Github repository for this project is here_.

.. _different: http://epydoc.sourceforge.net/epydoc.html#the-epytext-markup-language
.. _`this file`: http://docutils.sourceforge.net/docs/user/rst/quickref.html
.. _here: https://github.com/wware/dumb-epydoc-project

This looks like how you're supposed to use it::

    rm -rf html/
    epydoc -v -o html foo
    x-www-browser html/index.html

Run this stuff in a virtualenv, like this::

    virtualenv venv
    source venv/bin/activate
    pip install -r requirements.txt

You can run a few doctest tests this way::

    python foo/__init__.py
