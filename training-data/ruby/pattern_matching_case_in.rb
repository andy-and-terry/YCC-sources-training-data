config = {db: {user: "admin", port: 5432}, mode: "dev"}

case config
in {db: {user: String => user, port: Integer => port}, mode: "dev" | "test" => mode}
  puts "#{user}@#{port} (#{mode})"
end

case [1, [2, 3]]
in [a, [b, *rest]]
  p [a, b, rest]
end
