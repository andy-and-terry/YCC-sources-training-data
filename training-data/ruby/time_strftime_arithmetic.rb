require "time"
t = Time.utc(2024, 2, 28, 23, 30)
puts t.strftime("%Y-%m-%d %H:%M %A"), (t + 3600 * 2).iso8601, (t + 86400 * 2).strftime("%b %e")
puts Time.parse("2024-03-01 12:00:00 UTC") - t
puts t.to_a.first(6).inspect, t.wday, t.yday
