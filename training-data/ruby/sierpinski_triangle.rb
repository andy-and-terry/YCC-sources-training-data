n = 8
n.times do |r|
  puts " " * (n - r - 1) + (0..r).map { |c| (r & c) == c ? "* " : "  " }.join
end
