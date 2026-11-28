defprotocol Describe do
  def describe(x)
end

defimpl Describe, for: Integer do
  def describe(n), do: "int #{n}"
end

defimpl Describe, for: BitString do
  def describe(s), do: "str #{s}"
end

IO.puts(Describe.describe(5))
IO.puts(Describe.describe("hi"))
