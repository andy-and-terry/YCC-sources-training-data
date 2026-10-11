defmodule Greeter do
  def greet(name, greeting \\ "Hello", punct \\ "!")

  def greet(name, greeting, punct) when is_binary(name) do
    greeting <> ", " <> name <> punct
  end

  def greet(_, _, _), do: raise(ArgumentError, "name must be a string")
end

IO.puts(Greeter.greet("Ann"))
IO.puts(Greeter.greet("Bob", "Hi"))
IO.puts(Greeter.greet("Cy", "Yo", "?"))

try do
  Greeter.greet(:nope)
rescue
  e in ArgumentError -> IO.puts("error: " <> e.message)
end
