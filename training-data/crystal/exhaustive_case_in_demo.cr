enum Light
  Red
  Yellow
  Green
end

def action(l : Light) : String
  case l
  in Light::Red    then "stop"
  in Light::Yellow then "slow"
  in Light::Green  then "go"
  end
end

Light.each { |l| puts "#{l}: #{action(l)}" }

def kind(x : Int32 | String | Nil)
  case x
  in Int32  then "number"
  in String then "text"
  in Nil    then "nothing"
  end
end

puts kind(1), kind("a"), kind(nil)

case {1, "x"}
in {Int32, String}
  puts "tuple of int and string"
end
