# IO.inspect/2 options control labels, truncation, and formatting.
data = %{name: "widget", tags: Enum.to_list(1..30), nested: %{a: %{b: %{c: 1}}}}

IO.inspect(data, label: "default", limit: 5)
IO.inspect(data.nested, label: "depth", depth: 2)
IO.inspect([104, 105], label: "charlist")
IO.inspect([104, 105], label: "as list", charlists: :as_lists)
IO.inspect(1_000_000, label: "base", base: :hex)
IO.inspect(data.tags, label: "wide", width: 20, limit: 8)

# IO.inspect returns its argument, so it can sit in the middle of a pipeline.
data.tags
|> Enum.take(3)
|> IO.inspect(label: "after take")
|> Enum.sum()
|> IO.inspect(label: "sum")

IO.puts(inspect(:atom, pretty: true))
IO.puts(inspect("text <> quotes\"", printable_limit: 8))
