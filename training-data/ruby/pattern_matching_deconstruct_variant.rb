config = { db: { host: "h", port: 5432 }, mode: "dev" }

case config
in { db: { host:, port: Integer => port }, mode: "dev" }
  puts "dev db #{host}:#{port}"
else
  puts "no match"
end
