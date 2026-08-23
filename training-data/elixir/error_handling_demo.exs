defmodule ErrorHandling do
  def safe_divide(_a, 0), do: {:error, "division by zero"}
  def safe_divide(a, b), do: {:ok, a / b}

  def run do
    case safe_divide(10, 2) do
      {:ok, result} -> IO.puts("Result: #{result}")
      {:error, reason} -> IO.puts("Error: #{reason}")
    end

    try do
      raise ArgumentError, "bad argument"
    rescue
      e in ArgumentError -> IO.puts("Caught: #{e.message}")
    end

    case safe_divide(5, 0) do
      {:ok, result} -> IO.puts("Result: #{result}")
      {:error, reason} -> IO.puts("Error: #{reason}")
    end
  end
end

ErrorHandling.run()
