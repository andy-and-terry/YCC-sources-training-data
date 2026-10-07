def count_and_say(n)
  (n - 1).times.reduce('1') { |s, _| s.gsub(/(\d)\1*/) { |run| "#{run.size}#{run[0]}" } }
end

(1..10).each { |i| puts "#{i.to_s.rjust(2)} #{count_and_say(i)}" }
