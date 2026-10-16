defprotocol Describe do
  @fallback_to_any true
  def describe(value)
end

defimpl Describe, for: Integer do
  def describe(n), do: "int #{n}"
end

defimpl Describe, for: List do
  def describe(l), do: "list of #{length(l)}"
end

defimpl Describe, for: Any do
  def describe(_), do: "something else"
end

IO.puts(Describe.describe(7))
IO.puts(Describe.describe([1, 2]))
IO.puts(Describe.describe(:atom))
