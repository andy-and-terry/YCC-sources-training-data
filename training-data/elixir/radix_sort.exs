defmodule RadixSort do
  def sort([]), do: []

  def sort(list) do
    max_digits = list |> Enum.max() |> digit_count()
    Enum.reduce(0..(max_digits - 1), list, &sort_by_digit/2)
  end

  defp sort_by_digit(place, list) do
    empty_buckets = Map.new(0..9, &{&1, []})

    buckets =
      Enum.reduce(list, empty_buckets, fn n, acc ->
        digit = n |> div(Integer.pow(10, place)) |> rem(10)
        Map.update!(acc, digit, &(&1 ++ [n]))
      end)

    Enum.flat_map(0..9, &Map.fetch!(buckets, &1))
  end

  defp digit_count(0), do: 1
  defp digit_count(n), do: n |> Integer.to_string() |> String.length()
end

IO.inspect(RadixSort.sort([170, 45, 75, 90, 802, 24, 2, 66]))
