defmodule GuardClauses do
  def classify(n) when is_integer(n) and n < 0, do: :negative
  def classify(0), do: :zero
  def classify(n) when is_integer(n) and rem(n, 2) == 0, do: :even
  def classify(n) when is_integer(n), do: :odd
  def classify(_), do: :not_a_number
end

IO.inspect(GuardClauses.classify(-5))
IO.inspect(GuardClauses.classify(0))
IO.inspect(GuardClauses.classify(4))
IO.inspect(GuardClauses.classify(7))
IO.inspect(GuardClauses.classify("x"))
