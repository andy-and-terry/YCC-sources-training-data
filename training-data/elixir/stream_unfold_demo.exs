defmodule StreamUnfoldDemo do
  def run do
    fibonacci =
      Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
      |> Enum.take(10)

    IO.inspect(fibonacci)
  end
end

StreamUnfoldDemo.run()
