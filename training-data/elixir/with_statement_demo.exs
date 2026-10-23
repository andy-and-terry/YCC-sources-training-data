defmodule WithDemo do
  def parse_and_double(str) do
    with {n, ""} <- Integer.parse(str),
         true <- n > 0 do
      {:ok, n * 2}
    else
      :error -> {:error, :not_a_number}
      {_, _rest} -> {:error, :trailing_garbage}
      false -> {:error, :not_positive}
    end
  end
end

IO.inspect(WithDemo.parse_and_double("21"))
IO.inspect(WithDemo.parse_and_double("abc"))
IO.inspect(WithDemo.parse_and_double("5x"))
IO.inspect(WithDemo.parse_and_double("-3"))
