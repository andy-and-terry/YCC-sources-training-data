defprotocol Describe do
  def describe(value)
end

defimpl Describe, for: Integer do
  def describe(n), do: "integer #{n}"
end

defimpl Describe, for: List do
  def describe(list), do: "list of #{length(list)}"
end

defimpl Describe, for: Atom do
  def describe(a), do: "atom :#{a}"
end

IO.puts(Describe.describe(42))
IO.puts(Describe.describe([1, 2, 3]))
IO.puts(Describe.describe(:ok))
