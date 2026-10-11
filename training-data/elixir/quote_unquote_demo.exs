expr = quote do: 1 + 2 * 3
IO.inspect(expr)
IO.inspect(Code.eval_quoted(expr) |> elem(0))

n = 5
IO.inspect(quote(do: unquote(n) + 1))

list = quote do: [a, b]
IO.inspect(list)
IO.puts(Macro.to_string(quote do: if(x, do: 1, else: 2)))

{:+, _meta, args} = quote do: 4 + 5
IO.inspect(args)
