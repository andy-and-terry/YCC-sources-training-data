defmodule Mandel do
  def escape(cr, ci), do: loop(0.0, 0.0, cr, ci, 0)

  defp loop(_, _, _, _, 30), do: 30
  defp loop(zr, zi, cr, ci, n) when zr * zr + zi * zi >= 4, do: n
  defp loop(zr, zi, cr, ci, n), do: loop(zr * zr - zi * zi + cr, 2 * zr * zi + ci, cr, ci, n + 1)
end

for yi <- -5..5 do
  line = for xi <- -40..12, into: "", do: if(Mandel.escape(xi / 20, yi / 5) == 30, do: "#", else: ".")
  IO.puts(line)
end
