defmodule Parser do
  def parse("GET " <> path), do: {:get, path}
  def parse("POST " <> path), do: {:post, path}
  def parse(_), do: :unknown
end

"  get /home "
|> String.trim()
|> String.upcase()
|> Parser.parse()
|> IO.inspect()
