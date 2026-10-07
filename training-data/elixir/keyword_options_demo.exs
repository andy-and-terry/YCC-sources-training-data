defmodule Greeter do
  @defaults [greeting: "Hello", punctuation: "!", upcase: false]

  def greet(name, opts \\ []) do
    opts = Keyword.merge(@defaults, opts)
    message = "#{opts[:greeting]}, #{name}#{opts[:punctuation]}"
    if Keyword.fetch!(opts, :upcase), do: String.upcase(message), else: message
  end
end

IO.puts(Greeter.greet("Ann"))
IO.puts(Greeter.greet("Bob", greeting: "Hi", punctuation: "?"))
IO.puts(Greeter.greet("Cy", upcase: true))

opts = [a: 1, b: 2, a: 3]
IO.inspect(Keyword.get_values(opts, :a))
IO.inspect(Keyword.delete(opts, :a))
IO.inspect(Keyword.keys(opts))
IO.inspect(Keyword.take(opts, [:b]))
IO.inspect(Keyword.pop(opts, :b))
