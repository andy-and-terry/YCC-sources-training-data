e = [10, 20, 30].each
puts e.next, e.next, e.peek
puts e.next
begin
  e.next
rescue StopIteration
  puts "done"
end
puts %w[a b c].each_with_index.map { |s, i| "#{i}#{s}" }.join(",")
