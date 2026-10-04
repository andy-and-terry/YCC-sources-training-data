opts = [timeout: 5000, retries: 3, verbose: true]

IO.inspect(Keyword.get(opts, :timeout))
IO.inspect(Keyword.get(opts, :missing, :default))
IO.inspect(Keyword.fetch(opts, :retries))
IO.inspect(Keyword.has_key?(opts, :verbose))

updated = Keyword.put(opts, :retries, 5)
IO.inspect(updated)
IO.inspect(Keyword.delete(updated, :verbose))
IO.inspect(Keyword.merge(opts, retries: 1, level: :debug))
IO.inspect(Keyword.keys(opts))
IO.inspect(Keyword.values(opts))

dup = [a: 1, a: 2, b: 3]
IO.inspect(Keyword.get_values(dup, :a))
IO.inspect(Keyword.new([{:x, 1}]))
