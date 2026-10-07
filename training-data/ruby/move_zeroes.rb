def move_zeroes!(a)
  write = 0
  a.each do |x|
    next if x.zero?

    a[write] = x
    write += 1
  end
  a.fill(0, write)
end

p move_zeroes!([0, 1, 0, 3, 12, 0, 7])
nonzero, zeros = [0, 1, 0, 3, 12].partition(&:nonzero?)
p nonzero + zeros
