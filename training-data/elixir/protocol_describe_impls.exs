defprotocol Describe do
  def describe(x)
end

defimpl Describe, for: Integer do
  def describe(x), do: "int #{x}"
end

defimpl Describe, for: BitString do
  def describe(x), do: "string #{x}"
end

IO.puts(Describe.describe(5))
IO.puts(Describe.describe("hi"))
