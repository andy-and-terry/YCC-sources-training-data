defprotocol Describe do
  def describe(x)
end
defimpl Describe, for: Integer do
  def describe(n), do: "int #{n}"
end
defimpl Describe, for: List do
  def describe(l), do: "list of #{length(l)}"
end
IO.puts(Describe.describe(5))
IO.puts(Describe.describe([1, 2, 3]))
