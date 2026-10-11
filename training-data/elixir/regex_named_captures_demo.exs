re = ~r/(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/

IO.inspect(Regex.named_captures(re, "date: 2024-03-15!"))
IO.inspect(Regex.run(re, "on 1999-12-31", capture: :all_but_first))
IO.inspect(Regex.scan(~r/\d+/, "a1 b22 c333"))
IO.inspect(Regex.replace(~r/(\w+)@(\w+)/, "me@host", "\\2 at \\1"))
IO.inspect("hello" =~ ~r/ell/)
IO.inspect(Regex.match?(~r/^\d+$/, "123x"))
