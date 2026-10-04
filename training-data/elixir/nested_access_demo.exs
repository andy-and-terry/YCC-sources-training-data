config = %{
  db: %{host: "localhost", port: 5432, pools: [%{size: 5}, %{size: 10}]},
  debug: false
}

IO.inspect(get_in(config, [:db, :host]))
IO.inspect(get_in(config, [:db, :missing, :deep]))
IO.inspect(config.db.port)

config = put_in(config, [:db, :port], 6543)
config = update_in(config, [:db, :host], &String.upcase/1)
IO.inspect(config.db)

config = update_in(config, [:db, :pools, Access.all(), :size], &(&1 * 2))
IO.inspect(get_in(config, [:db, :pools, Access.all(), :size]))

{old, config} = pop_in(config, [:debug])
IO.inspect(old)
IO.inspect(Map.keys(config))

IO.inspect(%{config | db: %{config.db | port: 1}} |> get_in([:db, :port]))
