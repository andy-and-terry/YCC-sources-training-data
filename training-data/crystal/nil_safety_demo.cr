def find_user(id : Int32) : String?
  {1 => "Ada", 2 => "Bob"}[id]?
end

name = find_user(1)
puts name.try(&.upcase) || "not found"

missing = find_user(9)
puts missing.try(&.upcase) || "not found"

if found = find_user(2)
  puts "found: #{found}"
end
