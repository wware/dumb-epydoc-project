def x_intercept(m, b):
    """
    Return the x intercept of the line M{y=m*x+b}.  The X{x intercept}
    of a line is the point at which it crosses the x axis (M{y=0}).

    This function cannot be used in conjuction with L{safe_json} for
    anything.

    @type  m: number
    @param m: The slope of the line.
    @type  b: number
    @param b: The y intercept of the line.  The X{y intercept} of a
              line is the point at which it crosses the y axis (M{x=0}).
    @rtype:   number
    @return:  the x intercept of the line M{y=m*x+b}.
    """
    return -b/m


def safe_json(obj):
    """
    Return a JSONable version of the input object.
    Doctest:

        >>> L = safe_json(set(["a", "b", "c"]))
        >>> isinstance(L, list)
        True
        >>> set(L) == set(["a", "b", "c"])
        True

    @type  obj: object, dictionary, list, or set
    @param obj: The object to be made JSONable.
    @return:  the JSONable version of the object.
    """
    # Python sets are not JSONable. Convert them to lists.
    if isinstance(obj, set) or isinstance(obj, list):
        return [safe_json(x) for x in obj]
    elif isinstance(obj, dict):
        return dict([(key, safe_json(obj.get(key))) for key in obj])
    else:
        return obj
