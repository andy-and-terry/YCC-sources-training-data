enum Color
  Red
  Green
  Blue

  def warm? = self == Red
end

Color.each { |c| puts "#{c} #{c.value} #{c.warm?}" }
puts Color.parse("green")
