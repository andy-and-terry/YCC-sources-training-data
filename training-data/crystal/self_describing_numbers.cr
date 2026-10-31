def self_describing?(n : Int32) : Bool
  digits = n.digits.reverse
  digits.each_with_index.all? { |d, i| digits.count(i) == d }
end

[1210, 2020, 21200, 1211].each { |n| puts "#{n} #{self_describing?(n)}" }
