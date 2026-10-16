defmodule Temperature do
  def to_fahrenheit(c), do: c |> scale() |> offset()

  defp scale(c), do: c * 9 / 5
  defp offset(v), do: v + 32

  @doc false
  def internal, do: :hidden
end

IO.inspect(Temperature.to_fahrenheit(100))

try do
  apply(Temperature, :scale, [1])
rescue
  UndefinedFunctionError -> IO.puts("scale/1 is private")
end
