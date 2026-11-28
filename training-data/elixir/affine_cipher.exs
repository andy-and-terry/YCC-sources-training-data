defmodule Affine do
  def mod_inverse(a, m), do: Enum.find(1..(m - 1), fn x -> rem(a * x, m) == 1 end)

  def run(text, a, b, decrypt? \\ false) do
    inv = mod_inverse(a, 26)

    for <<ch <- text>>, into: "" do
      if ch in ?A..?Z do
        x = ch - ?A
        y = if decrypt?, do: Integer.mod(inv * (x - b), 26), else: rem(a * x + b, 26)
        <<y + ?A>>
      else
        <<ch>>
      end
    end
  end
end

c = Affine.run("AFFINE", 5, 8)
IO.puts("#{c} #{Affine.run(c, 5, 8, true)}")
