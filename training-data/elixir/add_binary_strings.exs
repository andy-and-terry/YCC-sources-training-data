defmodule AddBinary do
  def run(a, b) do
    Integer.to_string(String.to_integer(a, 2) + String.to_integer(b, 2), 2)
  end

  # Manual carry propagation over reversed digit lists.
  def manual(a, b) do
    n = max(String.length(a), String.length(b))
    xs = a |> String.pad_leading(n, "0") |> String.graphemes() |> Enum.reverse()
    ys = b |> String.pad_leading(n, "0") |> String.graphemes() |> Enum.reverse()

    {carry, bits} =
      Enum.zip(xs, ys)
      |> Enum.reduce({0, []}, fn {x, y}, {c, acc} ->
        s = String.to_integer(x) + String.to_integer(y) + c
        {div(s, 2), [rem(s, 2) | acc]}
      end)

    Enum.join(if(carry > 0, do: [1 | bits], else: bits))
  end
end

IO.puts(AddBinary.run("1010", "1011"))    # 10101
IO.puts(AddBinary.manual("1010", "1011")) # 10101
