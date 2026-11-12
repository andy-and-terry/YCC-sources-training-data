import textwrap

s = """
    Hello there,
        indented line.
"""
print(textwrap.dedent(s).strip())
print(textwrap.fill("the quick brown fox jumps over the lazy dog", width=15))
