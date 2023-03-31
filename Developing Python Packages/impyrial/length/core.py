"""
Conversions between inches and feet or yards.
"""
INCHES_PER_FOOT = 12.0
INCHES_PER_YARD = INCHES_PER_FOOT * 3.0
UNITS = ("in", "ft", "yd")


def inches_to_feet(x, reverse=False):
    """
    Convert lengths between inches and feet.

    Parameters
    ----------
    x: array_like
        Lengths in inches or feet
    reverse : bool, optional
        If this is set to True, this function converts from feet to inches
        instead of the default behavior of inches to feet.

    Returns
    -------
    ndarray
        An array of converted lengths with the same shape as `x`. If `x` is a
        0-d array, then a scalar is returned.
    """
    if reverse:
        return x * INCHES_PER_FOOT
    else:
        return x / INCHES_PER_FOOT


def inches_to_yards(x, reverse=False):
    """
    Convert lengths between inches and yards.

    Parameters
    ----------
    x: array_like
        Lengths in inches or yards
    reverse : bool, optional
        If this is set to True, this function converts from yards to inches
        instead of the default behavior of inches to yards.

    Returns
    -------
    ndarray
        An array of converted lengths with the same shape as `x`. If `x` is a
        0-d array, then a scalar is returned.
    """
    if reverse:
        return x * INCHES_PER_YARD
    else:
        return x / INCHES_PER_YARD
