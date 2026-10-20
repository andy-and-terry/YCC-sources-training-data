enum Color
  Red
  Green
  Blue

  def warm?
    red?
  end
end

@[Flags]
enum Perm
  Read
  Write
  Exec
end

puts Color::Green.value, Color.parse("blue"), Color.new(0), Color.names.inspect, Color::Red.warm?
p = Perm::Read | Perm::Exec
puts p, p.includes?(Perm::Write), p.read?, p.value, Perm.from_value(3)

def classify(x)
  case x
  in Int32 then "int"
  in String then "string"
  in Array(Int32) then "ints"
  in Nil then "nil"
  end
end
puts classify(1), classify("s"), classify([1]), classify(nil)

case {1, "a"}
when {Int32, String}
  puts "tuple types"
end
case 15
when 0..9 then puts "digit"
when 10..99 then puts "two digits"
end
value = 5
puts (case value when 1, 2 then "low" when 3..6 then "mid" else "high" end)
