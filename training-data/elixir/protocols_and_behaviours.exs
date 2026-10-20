defprotocol Describe do
  def describe(value)
end

defimpl Describe, for: Integer do
  def describe(n), do: "int #{n}"
end

defimpl Describe, for: List do
  def describe(l), do: "list of #{length(l)}"
end

defimpl Describe, for: Any do
  def describe(_), do: "something"
end

defmodule Animal do
  @callback sound() :: String.t()
  @callback name() :: String.t()
end

defmodule Dog do
  @behaviour Animal
  def sound, do: "woof"
  def name, do: "dog"
end

IO.puts(Describe.describe(5))
IO.puts(Describe.describe([1, 2]))
IO.puts("#{Dog.name()} says #{Dog.sound()}")
