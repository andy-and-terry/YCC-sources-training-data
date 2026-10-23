# Handling nilable values with try, not_nil!, and the || default idiom.
names = {"ann" => "Ann Lee", "bob" => nil}

def shout(s : String?) : String?
  s.try &.upcase
end

puts shout(names["ann"]).inspect
puts shout(names["bob"]).inspect
puts shout(names["zed"]?).inspect

full = names["ann"].not_nil!
puts full.size

puts (names["bob"] || "anonymous")

begin
  names["bob"].not_nil!
rescue ex : NilAssertionError
  puts "caught: #{ex.class}"
end
