defmodule RailFence do
  def order(n, k) do
    cycle = 2 * (k - 1)
    rail = fn i -> r = rem(i, cycle); if r < k, do: r, else: cycle - r end
    Enum.sort_by(0..(n - 1), fn i -> {rail.(i), i} end)
  end

  def encrypt(t, k) do
    chars = String.graphemes(t)
    order(length(chars), k) |> Enum.map(&Enum.at(chars, &1)) |> Enum.join()
  end

  def decrypt(c, k) do
    chars = String.graphemes(c)

    order(length(chars), k)
    |> Enum.zip(chars)
    |> Enum.sort_by(&elem(&1, 0))
    |> Enum.map_join(&elem(&1, 1))
  end
end

c = RailFence.encrypt("WEAREDISCOVERED", 3)
IO.puts("#{c} #{RailFence.decrypt(c, 3)}")
