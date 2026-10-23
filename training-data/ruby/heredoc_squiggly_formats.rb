# Heredoc flavours: <<~ strips common indentation, <<- allows an indented
# terminator, and quoting the tag disables interpolation.
name = "Ada"

greeting = <<~TEXT
  Hello, #{name}!
    This line keeps its extra indent.
  Done.
TEXT
puts greeting

raw = <<~'RAW'
  No #{interpolation} here\n stays literal.
RAW
puts raw

old_style = <<-OLD
    indentation is kept
    OLD
puts old_style

# A heredoc can be used as a method argument, with a method called on it.
puts <<~A.upcase + <<~B.reverse
  first
A
  second
B

sql = <<~SQL.lines.map(&:strip).join(" ")
  SELECT id, name
  FROM users
  WHERE active = 1
SQL
puts sql
