defmodule MyMacros do
  defmacro unless_nil(value, do: block) do
    quote do
      if unquote(value) != nil, do: unquote(block)
    end
  end

  defmacro twice(expr) do
    quote do
      unquote(expr)
      unquote(expr)
    end
  end
end

defmodule Use do
  require MyMacros
  def run do
    MyMacros.unless_nil(5, do: IO.puts("not nil"))
    MyMacros.twice(IO.puts("again"))
  end
end

Use.run()
IO.inspect(quote do: 1 + 2 * x)
IO.inspect(Macro.to_string(quote(do: a.b(c))))
