defprotocol Describable do
  def describe(value)
end

defimpl Describable, for: Integer do
  def describe(value), do: "Integer: #{value}"
end

defimpl Describable, for: BitString do
  def describe(value), do: "String: #{value}"
end

defimpl Describable, for: List do
  def describe(value), do: "List with #{length(value)} elements"
end

IO.inspect(Describable.describe(42))
IO.inspect(Describable.describe("hello"))
IO.inspect(Describable.describe([1, 2, 3]))
