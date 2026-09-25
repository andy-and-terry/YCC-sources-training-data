defmodule Histogram do
  def render(text, width \\ 30) do
    counts = text |> String.graphemes() |> Enum.frequencies() |> Enum.sort()
    peak = counts |> Enum.map(&elem(&1, 1)) |> Enum.max()

    Enum.map_join(counts, "\n", fn {k, n} ->
      "#{k} | #{String.duplicate("#", max(1, div(n * width, peak)))} #{n}"
    end)
  end
end

IO.puts(Histogram.render("theraininspainfallsmainlyontheplain"))
