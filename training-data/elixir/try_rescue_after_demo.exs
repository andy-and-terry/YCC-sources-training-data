defmodule Safe do
  def divide(a, b) do
    try do
      a / b
    rescue
      ArithmeticError -> :div_by_zero
    after
      IO.puts("divide(#{a}, #{b}) done")
    end
  end

  def parse(str) do
    case Integer.parse(str) do
      {n, ""} -> {:ok, n}
      _ -> {:error, :invalid}
    end
  end

  def thrower do
    try do
      throw(:early)
    catch
      :throw, value -> {:caught, value}
    end
  end

  def exit_catcher do
    try do
      exit(:shutdown)
    catch
      :exit, reason -> {:exited, reason}
    end
  end
end

IO.inspect(Safe.divide(10, 2))
IO.inspect(Safe.divide(1, 0))
IO.inspect(Safe.parse("42"))
IO.inspect(Safe.parse("4x"))
IO.inspect(Safe.thrower())
IO.inspect(Safe.exit_catcher())

result =
  try do
    raise ArgumentError, "bad"
  rescue
    e in ArgumentError -> Exception.message(e)
  else
    _ -> "unreachable"
  end

IO.inspect(result)
