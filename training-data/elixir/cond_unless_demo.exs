defmodule Grade do
  def letter(score) do
    cond do
      score >= 90 -> "A"
      score >= 80 -> "B"
      score >= 70 -> "C"
      true -> "F"
    end
  end

  def describe(n) do
    if rem(n, 2) == 0 do
      "even"
    else
      "odd"
    end
  end

  def warn_unless_positive(n) do
    unless n > 0 do
      IO.puts("warning: #{n} is not positive")
    end

    n
  end
end

Enum.each([95, 85, 72, 40], fn s -> IO.puts("#{s} -> #{Grade.letter(s)}") end)
IO.puts(Grade.describe(7))
Grade.warn_unless_positive(-3)

result = if true, do: :yes, else: :no
IO.inspect(result)
IO.inspect(if(false, do: :never))
