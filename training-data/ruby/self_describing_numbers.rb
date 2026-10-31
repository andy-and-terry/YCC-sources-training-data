def self_describing?(n)
  s = n.to_s
  s.each_char.with_index.all? { |d, i| s.count(i.to_s) == d.to_i }
end

[1210, 2020, 21_200, 1211].each { |n| puts "#{n} #{self_describing?(n)}" }
