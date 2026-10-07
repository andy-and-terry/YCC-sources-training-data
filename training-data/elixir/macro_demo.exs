defmodule MyMacros do
  defmacro unless_zero(value, do: block) do
    quote do
      if unquote(value) != 0 do
        unquote(block)
      end
    end
  end

  defmacro trace(expr) do
    quote do
      result = unquote(expr)
      IO.puts("#{unquote(Macro.to_string(expr))} = #{inspect(result)}")
      result
    end
  end
end

defmodule Demo do
  require MyMacros

  def run do
    MyMacros.unless_zero 5 do
      IO.puts("five is not zero")
    end

    MyMacros.trace(2 + 3 * 4)
  end
end

Demo.run()
