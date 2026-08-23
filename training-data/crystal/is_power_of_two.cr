def power_of_two?(n : Int32) : Bool
  n > 0 && (n & (n - 1)) == 0
end

[1, 2, 3, 4, 16, 18].each do |n|
  puts "#{n}: #{power_of_two?(n)}"
end
