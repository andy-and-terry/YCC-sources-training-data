defmodule M do
  defmacro my_unless(cond, do: body) do
    quote do
      if !unquote(cond), do: unquote(body)
    end
  end
end

require M
IO.inspect(M.my_unless(1 > 2, do: :ran))
