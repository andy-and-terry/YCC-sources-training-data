date = ~r/(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/

IO.inspect(Regex.match?(date, "2024-05-17"))
IO.inspect(Regex.run(date, "on 2024-05-17 ok"))
IO.inspect(Regex.named_captures(date, "on 2024-05-17 ok"))
IO.inspect(Regex.scan(~r/\d+/, "a1 b22 c333"))
IO.inspect(Regex.replace(date, "2024-05-17", "\\3/\\2/\\1"))
IO.inspect(Regex.split(~r/\s*,\s*/, "a , b,c ,d"))
IO.inspect(String.replace("hello world", ~r/o/, "0"))
IO.inspect("Hello" =~ ~r/^h/i)
IO.inspect(Regex.replace(~r/\b(\w)/, "make title case", fn _, c -> String.upcase(c) end))
IO.inspect(Regex.source(~r/ab+c/))
