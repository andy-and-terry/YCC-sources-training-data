defmodule RailFence do
  def encode(text, rails) do
    period = 2 * (rails - 1)

    text
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.sort_by(fn {_, i} ->
      m = rem(i, period)
      {if(m < rails, do: m, else: period - m), i}
    end)
    |> Enum.map_join(&elem(&1, 0))
  end
end

IO.puts(RailFence.encode("WEAREDISCOVERED", 3))
