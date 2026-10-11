class Duck
  def speak
    "Quack"
  end
end

class Stone
end

[Duck.new, Stone.new].each do |thing|
  if thing.responds_to?(:speak)
    puts thing.speak
  else
    puts "#{thing.class} is silent"
  end
end

x = [1, "two", nil, 3.5].map do |v|
  case v
  when Int32   then "int"
  when String  then "string"
  when Nil     then "nil"
  else              "other"
  end
end
puts x.join(",")
