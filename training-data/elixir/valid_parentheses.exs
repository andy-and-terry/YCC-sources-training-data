defmodule ValidParens do
  @pairs %{")" => "(", "]" => "[", "}" => "{"}

  def valid?(str) do
    str
    |> String.graphemes()
    |> Enum.reduce_while([], fn ch, stack ->
      cond do
        ch in ["(", "[", "{"] ->
          {:cont, [ch | stack]}

        ch in [")", "]", "}"] ->
          case stack do
            [top | rest] when top == @pairs[ch] -> {:cont, rest}
            _ -> {:halt, :invalid}
          end

        true ->
          {:cont, stack}
      end
    end)
    |> case do
      [] -> true
      _ -> false
    end
  end
end

IO.inspect(ValidParens.valid?("{[()]}"))
IO.inspect(ValidParens.valid?("{[(])}"))
