# Time arithmetic with Time::Span and measuring elapsed time.
t = Time.utc(2024, 2, 28, 12, 0, 0)
puts t + 2.days
puts (t + 1.hour).to_s("%H:%M")
puts t.day_of_week
puts t.day_of_year

span = 90.minutes
puts span.total_hours
puts span.hours
puts span.minutes

elapsed = Time.measure { (1..100_000).sum }
puts elapsed < 1.second
