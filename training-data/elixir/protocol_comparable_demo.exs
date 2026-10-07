defprotocol Comparable do
  def compare(a, b)
end

defmodule Fraction do
  defstruct numerator: 0, denominator: 1
end

defmodule Version do
  defstruct major: 0, minor: 0, patch: 0
end

defimpl Comparable, for: Fraction do
  def compare(%Fraction{numerator: n1, denominator: d1}, %Fraction{numerator: n2, denominator: d2}) do
    cond do
      n1 * d2 == n2 * d1 -> :eq
      n1 * d2 < n2 * d1 -> :lt
      true -> :gt
    end
  end
end

defimpl Comparable, for: Version do
  def compare(%Version{major: ma, minor: mi, patch: pa}, %Version{major: mb, minor: mib, patch: pb}) do
    cond do
      {ma, mi, pa} == {mb, mib, pb} -> :eq
      {ma, mi, pa} < {mb, mib, pb} -> :lt
      true -> :gt
    end
  end
end

defmodule Sorter do
  def sort(list), do: Enum.sort(list, &(Comparable.compare(&1, &2) in [:lt, :eq]))
end

fractions = [
  %Fraction{numerator: 1, denominator: 2},
  %Fraction{numerator: 1, denominator: 4},
  %Fraction{numerator: 3, denominator: 4}
]

versions = [
  %Version{major: 1, minor: 2, patch: 0},
  %Version{major: 1, minor: 0, patch: 5},
  %Version{major: 2, minor: 0, patch: 0}
]

IO.inspect(Sorter.sort(fractions))
IO.inspect(Sorter.sort(versions))
