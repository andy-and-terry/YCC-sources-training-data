name = "world"

text = """
Hello, #{name}!
Sum is #{1 + 2}.
  Indented line stays indented.
"""

IO.write(text)
IO.puts(~s(sigil with "quotes" and #{name}))
IO.puts(~S(raw #{name} not interpolated))
IO.puts("tab\tseparated\nnewline")
