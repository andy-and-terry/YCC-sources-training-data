defmodule Signup do
  def run(params) do
    with {:ok, name} <- Map.fetch(params, :name),
         {:ok, age} <- Map.fetch(params, :age),
         true <- age >= 18 do
      {:ok, "#{name} registered"}
    else
      :error -> {:error, :missing_field}
      false -> {:error, :too_young}
    end
  end
end

IO.inspect(Signup.run(%{name: "ann", age: 20}))
IO.inspect(Signup.run(%{name: "bob", age: 10}))
IO.inspect(Signup.run(%{}))
