config = %{
  server: %{host: "localhost", ports: [80, 443]},
  users: [%{name: "ann", role: :admin}, %{name: "bob", role: :guest}]
}

IO.inspect(get_in(config, [:server, :host]))
IO.inspect(get_in(config, [:users, Access.at(1), :name]))
IO.inspect(get_in(config, [:server, :missing, :deep]))

config = put_in(config, [:server, :host], "example.com")
config = update_in(config, [:users, Access.all(), :role], fn _ -> :member end)
config = update_in(config.server.ports, &[8080 | &1])

IO.inspect(config.server)
IO.inspect(Enum.map(config.users, & &1.role))

{old, config} = pop_in(config, [:server, :ports])
IO.inspect(old)
IO.inspect(Map.keys(config.server))
