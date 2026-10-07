opts = [color: "red", size: 3, color: "blue"]

IO.inspect(Keyword.get(opts, :color))
IO.inspect(Keyword.get_values(opts, :color))
IO.inspect(Keyword.put(opts, :size, 10))
IO.inspect(Keyword.delete(opts, :color))
IO.inspect(Keyword.keys(opts))
IO.inspect(Keyword.merge([a: 1, b: 2], b: 3, c: 4))
IO.inspect(Keyword.fetch!(opts, :size))
IO.inspect(opts[:missing])

defmodule Greeter do
  def hello(name, opts \\ []) do
    greeting = Keyword.get(opts, :greeting, "Hello")
    punct = Keyword.get(opts, :punct, "!")
    "#{greeting}, #{name}#{punct}"
  end
end

IO.puts(Greeter.hello("Ann"))
IO.puts(Greeter.hello("Bob", greeting: "Hi", punct: "?"))
