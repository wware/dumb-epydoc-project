"""
I want to do a little project with Epydoc just to get familiar with it.
Something not too labor-intensive, but to get an idea what it can do.

  - U{http://epydoc.sourceforge.net/manual-usage.html}
  - U{http://epydoc.sourceforge.net/manual-docstring.html}
  - U{http://epydoc.sourceforge.net/manual-epytext.html}

This looks like how you're supposed to use it::

    rm -rf html/
    epydoc -v -o html foo
    x-www-browser html/index.html

Well that was fun.
"""

from thing1 import safe_json, x_intercept

if __name__ == "__main__":
    import doctest
    doctest.testmod(verbose=2)
