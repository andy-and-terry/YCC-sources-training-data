defmodule Parse do
  def run(map) do
    with {:ok, a} <- Map.fetch(map, :a),
         {n, ""} <- Integer.parse(a),
         true <- n > 0 do
      {:ok, n * 2}
    else
      :error -> {:error, :missing}
      _ -> {:error, :invalid}
    end
  end
end
IO.inspect(Parse.run(%{a: "21"}))
IO.inspect(Parse.run(%{}))
IO.inspect(Parse.run(%{a: "-1"}))
