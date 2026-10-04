defmodule Options do
  @defaults [color: "red", size: 10, verbose: false]

  def build(opts) do
    Keyword.merge(@defaults, opts)
  end
end

opts = Options.build(size: 20, verbose: true)
IO.inspect(opts)
IO.inspect(Keyword.get(opts, :color))
IO.inspect(Keyword.fetch(opts, :missing))
IO.inspect(Keyword.keys(opts))
IO.inspect(Keyword.delete(opts, :size))
IO.inspect(opts[:size])

# Keyword lists allow duplicate keys; maps do not.
dup = [a: 1, a: 2, b: 3]
IO.inspect(Keyword.get_values(dup, :a))
IO.inspect(Map.new(dup))

{known, rest} = Keyword.split(opts, [:color])
IO.inspect({known, rest})
