defmodule Weather do
  def advice(temp) do
    cond do
      temp < 0 -> "freezing, stay in"
      temp < 15 -> "chilly, bring a coat"
      temp < 25 -> "pleasant"
      true -> "hot, drink water"
    end
  end

  def check(nil), do: "no reading"

  def check(temp) do
    unless is_number(temp) do
      "invalid"
    else
      advice(temp)
    end
  end
end

for t <- [-5, 10, 20, 31, nil, "warm"] do
  IO.puts("#{inspect(t)}: #{Weather.check(t)}")
end

x = if 3 > 2, do: :yes, else: :no
IO.inspect(x)
IO.inspect(if(false, do: :never))
