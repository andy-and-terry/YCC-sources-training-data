# Deterministic Time handling using fixed epoch values and UTC.
t = Time.at(1_700_000_000).utc
puts t
puts t.strftime("%Y-%m-%d %H:%M:%S")
puts t.strftime("%a %b %-d, %Y at %I:%M %p")
puts t.strftime("%j (day of year), week %U")
puts t.strftime("%FT%TZ")

later = t + 3600 * 24 * 30
puts later.strftime("%F")
puts ((later - t) / 86_400).to_i
puts t.wday, t.yday, t.monday?

parsed = Time.utc(2024, 2, 29, 12, 0, 0)
puts parsed.month, parsed.day
puts Time.utc(2024, 3, 1) - Time.utc(2024, 2, 1)
puts (parsed <=> t)
