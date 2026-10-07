date = ~r/(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/

IO.inspect(Regex.match?(date, "on 2024-03-15"))
IO.inspect(Regex.run(date, "on 2024-03-15"))
IO.inspect(Regex.named_captures(date, "on 2024-03-15"))
IO.inspect(Regex.scan(~r/\d+/, "a1b22c333"))
IO.inspect(Regex.replace(~r/\s+/, "a  b   c", " "))
IO.inspect(Regex.replace(~r/(\w+)@(\w+)/, "me@site", "\\2 at \\1"))
IO.inspect(Regex.split(~r/\d+/, "one1two22three"))
IO.inspect(String.match?("Hello", ~r/^hello$/i))
IO.inspect("a-b_c" =~ ~r/[-_]/)
IO.inspect(Regex.source(date) |> String.length())
