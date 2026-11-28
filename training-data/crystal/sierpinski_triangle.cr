n = 8
n.times do |r|
  print " " * (n - r - 1)
  (0..r).each { |c| print (r & c) == c ? "* " : "  " }
  puts
end
