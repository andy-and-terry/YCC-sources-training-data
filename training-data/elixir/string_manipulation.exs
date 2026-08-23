defmodule StringManipulation do
  def run do
    str = "Hello, Elixir World!"

    IO.inspect(String.upcase(str))
    IO.inspect(String.downcase(str))
    IO.inspect(String.length(str))
    IO.inspect(String.split(str, " "))
    IO.inspect(String.replace(str, "World", "Programming"))
    IO.inspect(String.slice(str, 0, 5))
    IO.inspect(String.starts_with?(str, "Hello"))
    IO.inspect(String.trim("   spaced   "))
  end
end

StringManipulation.run()
