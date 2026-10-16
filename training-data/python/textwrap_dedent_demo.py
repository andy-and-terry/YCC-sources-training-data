import textwrap

text = "The quick brown fox jumps over the lazy dog and keeps running far away."
print(textwrap.fill(text, width=30))
print(textwrap.wrap(text, 20)[:2])
print(textwrap.shorten(text, width=30, placeholder="..."))

block = """
    def hello():
        print("hi")
"""
print(textwrap.dedent(block))
print(textwrap.indent("a\nb\n\nc", "> "))
print(textwrap.fill(text, 28, initial_indent="* ", subsequent_indent="  "))
