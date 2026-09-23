defmodule KeywordListDemo do
  def greet(name, opts \\ []) do
    greeting = Keyword.get(opts, :greeting, "Hello")
    punctuation = Keyword.get(opts, :punctuation, "!")
    "#{greeting}, #{name}#{punctuation}"
  end

  def summarize(items) do
    Enum.map(items, fn {key, value} -> "#{key}=#{value}" end)
  end
end

IO.puts(KeywordListDemo.greet("Ada"))
IO.puts(KeywordListDemo.greet("Ada", greeting: "Hi", punctuation: "?"))

opts = [debug: true, retries: 3, timeout: 500]
IO.inspect(Keyword.get(opts, :retries))
IO.inspect(Keyword.get(opts, :missing, :default_value))
IO.inspect(KeywordListDemo.summarize(opts))
