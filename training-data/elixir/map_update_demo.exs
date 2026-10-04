user = %{name: "Ada", age: 36, langs: ["elixir"]}

IO.inspect(%{user | age: 37})
IO.inspect(Map.put(user, :email, "ada@example.com"))
IO.inspect(Map.update(user, :langs, [], &["erlang" | &1]))
IO.inspect(Map.update!(user, :age, &(&1 + 1)))
IO.inspect(Map.get(user, :missing, "n/a"))
IO.inspect(Map.take(user, [:name, :age]))
IO.inspect(Map.drop(user, [:langs]))
IO.inspect(Map.new(user, fn {k, v} -> {Atom.to_string(k), v} end))

nested = %{profile: %{address: %{city: "Lisbon"}}}
IO.inspect(get_in(nested, [:profile, :address, :city]))
IO.inspect(put_in(nested, [:profile, :address, :city], "Porto"))
IO.inspect(update_in(nested, [:profile, :address, :city], &String.upcase/1))
