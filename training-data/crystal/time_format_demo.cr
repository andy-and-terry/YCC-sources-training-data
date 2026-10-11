t = Time.utc(2024, 3, 15, 14, 30, 45)

puts t.to_s("%Y-%m-%d")
puts t.to_s("%H:%M:%S")
puts t.to_s("%B %-d, %Y")
puts t.to_s("%a %b %e")
puts t.year, t.month, t.day
puts t.day_of_week
puts t.day_of_year
puts (t + 2.days).to_s("%F")
puts (t - 1.month).to_s("%F")
puts t.at_beginning_of_month.to_s("%F")
puts (Time.utc(2024, 12, 25) - t).total_days.floor
puts t.to_unix
puts Time.unix(0).to_s("%F")
puts t.to_rfc3339
