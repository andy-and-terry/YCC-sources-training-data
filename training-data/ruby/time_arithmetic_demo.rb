t = Time.utc(2024, 2, 28, 12, 0, 0)
puts t
puts t + 86_400 * 2
puts (t + 86_400 * 2).day
puts t.year, t.month, t.wday, t.yday
puts t.strftime("%Y-%m-%d %H:%M:%S %A %b")
puts (Time.utc(2024, 3, 1) - t) / 3600
puts t.to_i, Time.at(0).utc
puts t.iso8601 rescue puts "need require 'time'"
require "time"
puts t.iso8601, Time.parse("2024-05-06 07:08:09 UTC").min
puts Time.utc(2024, 12, 31).yday
puts t.monday?, t.tuesday?
puts t < t + 1, (t <=> t)
puts Time.utc(2024, 1, 31).then { |x| x + 30 * 86_400 }.month
require "date"
puts Date.new(2024, 1, 31) >> 1, Date.new(2024, 2, 29).leap?
