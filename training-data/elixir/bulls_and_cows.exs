# Bulls and Cows scoring for equal-length digit strings.
defmodule BullsAndCows do
  def score(secret, guess) do
    pairs = Enum.zip(String.graphemes(secret), String.graphemes(guess))
    bulls = Enum.count(pairs, fn {s, g} -> s == g end)
    rest = Enum.reject(pairs, fn {s, g} -> s == g end)
    sc = rest |> Enum.map(&elem(&1, 0)) |> Enum.frequencies()
    gc = rest |> Enum.map(&elem(&1, 1)) |> Enum.frequencies()
    cows = Enum.sum(for {c, n} <- sc, do: min(n, Map.get(gc, c, 0)))
    {bulls, cows}
  end
end

{b, c} = BullsAndCows.score("1807", "7810")
IO.puts("#{b} bull(s), #{c} cow(s)")
