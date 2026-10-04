defmodule Options do
  def connect(host, opts \\ []) do
    port = Keyword.get(opts, :port, 80)
    timeout = Keyword.get(opts, :timeout, 5_000)
    ssl? = Keyword.get(opts, :ssl, false)
    "#{if ssl?, do: "https", else: "http"}://#{host}:#{port} (timeout #{timeout}ms)"
  end
end

IO.puts(Options.connect("example.com"))
IO.puts(Options.connect("example.com", port: 8443, ssl: true))

opts = [a: 1, b: 2, a: 3]
IO.inspect(Keyword.get(opts, :a))
IO.inspect(Keyword.get_values(opts, :a))
IO.inspect(Keyword.keys(opts))
IO.inspect(Keyword.merge([a: 1, b: 2], b: 20, c: 30))
IO.inspect(Keyword.delete(opts, :a))
IO.inspect(Keyword.fetch!([x: 1], :x))
IO.inspect(Keyword.has_key?(opts, :z))
IO.inspect(opts[:b])
