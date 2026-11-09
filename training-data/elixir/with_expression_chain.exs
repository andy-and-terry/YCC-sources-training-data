defmodule Parse do
  def run(map) do
    with {:ok, a} <- Map.fetch(map, :a),
         {:ok, b} <- Map.fetch(map, :b) do
      {:ok, a + b}
    else
      :error -> {:error, :missing_key}
    end
  end
end

IO.inspect(Parse.run(%{a: 1, b: 2}))
IO.inspect(Parse.run(%{a: 1}))
