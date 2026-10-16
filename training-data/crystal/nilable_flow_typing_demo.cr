def lookup(id : Int32) : String?
  {1 => "one", 2 => "two"}[id]?
end

if name = lookup(1)
  puts name.upcase
end

name = lookup(5)
puts name.nil?
puts (name || "default")
puts name.try(&.size).inspect

unless (found = lookup(2)).nil?
  puts found.size
end

x = lookup(3)
if x
  puts x.size
else
  puts "missing"
end

puts lookup(2).not_nil!.reverse
puts (lookup(9) || lookup(1)).inspect
