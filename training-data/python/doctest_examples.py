import doctest


def clamp(x, lo, hi):
    """Restrict x to the range [lo, hi].

    >>> clamp(5, 0, 10)
    5
    >>> clamp(-3, 0, 10)
    0
    >>> clamp(99, 0, 10)
    10
    """
    return max(lo, min(x, hi))


def words(text):
    """
    >>> words("  a  b c ")
    ['a', 'b', 'c']
    >>> words("")
    []
    """
    return text.split()


if __name__ == "__main__":
    print(doctest.testmod())
