defmodule MyMacros do
  defmacro my_unless(condition, do: block) do
    quote do
      if !unquote(condition), do: unquote(block)
    end
  end

  defmacro time_it(label, do: block) do
    quote do
      start = System.monotonic_time(:microsecond)
      result = unquote(block)
      _elapsed = System.monotonic_time(:microsecond) - start
      IO.puts("#{unquote(label)} finished")
      result
    end
  end
end

defmodule Run do
  require MyMacros
  import MyMacros

  def go do
    my_unless 1 > 2 do
      IO.puts("condition was false")
    end

    IO.inspect(time_it("sum", do: Enum.sum(1..100)))
  end
end

Run.go()
