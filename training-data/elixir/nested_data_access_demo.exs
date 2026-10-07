data = %{
  user: %{name: "Ann", langs: ["elixir", "go"], address: %{city: "Oslo"}},
  scores: [%{id: 1, pts: 10}, %{id: 2, pts: 20}]
}

IO.inspect(get_in(data, [:user, :address, :city]))
IO.inspect(get_in(data, [:user, :missing, :city]))
IO.inspect(get_in(data, [:scores, Access.all(), :pts]))
IO.inspect(get_in(data, [:user, :langs, Access.at(0)]))

updated = put_in(data, [:user, :address, :city], "Bergen")
IO.inspect(updated.user.address)

bumped = update_in(data, [:scores, Access.all(), :pts], &(&1 * 2))
IO.inspect(bumped.scores)

{old, new} = get_and_update_in(data, [:user, :name], fn n -> {n, String.upcase(n)} end)
IO.inspect(old)
IO.inspect(new.user.name)

IO.inspect(pop_in(data, [:user, :langs]) |> elem(0))
IO.inspect(data.user.address.city)
