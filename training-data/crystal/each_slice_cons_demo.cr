# Chunking and sliding windows over collections.
nums = (1..7).to_a

nums.each_slice(3) { |chunk| p chunk }

nums.each_cons(3) { |win| puts "#{win} sum=#{win.sum}" }

p nums.in_groups_of(3, 0)
p nums.partition(&.even?)
