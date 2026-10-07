s = "héllo 👋"

IO.inspect(String.length(s))
IO.inspect(byte_size(s))
IO.inspect(String.codepoints(s))
IO.inspect(String.to_charlist("abc"))
IO.inspect(String.graphemes("éa"))
IO.inspect(String.upcase("straße"))
IO.inspect(String.reverse("stressed"))
IO.inspect(String.at(s, 1))
IO.inspect(String.slice(s, 1..3))
IO.inspect(<<104, 105>>)
IO.inspect(?a)
IO.inspect(String.valid?(<<255>>))
