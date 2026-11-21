# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
def bouncy?(n)
  d = n.digits
  d != d.sort && d != d.sort.reverse
end

puts (1...1000).count { |n| bouncy?(n) }
