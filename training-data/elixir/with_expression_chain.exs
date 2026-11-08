defmodule Signup do
  def run(params) do
    with {:ok, name} <- fetch(params, :name),
         {:ok, age} <- fetch(params, :age),
         true <- age >= 18 do
      {:ok, "#{name} (#{age})"}
    else
      :error -> {:error, :missing_field}
      false -> {:error, :too_young}
    end
  end

  defp fetch(m, k), do: Map.fetch(m, k)
end

IO.inspect(Signup.run(%{name: "Ann", age: 30}))
IO.inspect(Signup.run(%{name: "Bo", age: 10}))
IO.inspect(Signup.run(%{name: "Cy"}))
