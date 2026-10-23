# Accessing and updating nested data with get_in, put_in, update_in, and pop_in.
config = %{
  db: %{host: "localhost", port: 5432},
  cache: %{ttl: 60},
  users: [%{name: "ann", age: 30}, %{name: "bob", age: 25}]
}

IO.inspect(get_in(config, [:db, :host]))
IO.inspect(get_in(config, [:users, Access.all(), :name]))

config = put_in(config, [:db, :port], 6543)
config = update_in(config, [:cache, :ttl], &(&1 * 2))
config = update_in(config, [:users, Access.at(0), :age], &(&1 + 1))

IO.inspect(config.db)
IO.inspect(config.cache)
IO.inspect(config.users)

{removed, config} = pop_in(config, [:db, :host])
IO.inspect(removed)
IO.inspect(config.db)

# Macro form uses dot syntax.
IO.inspect(put_in(config.cache.ttl, 1))
