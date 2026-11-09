enum Color
  Red
  Green
  Blue

  def warm?
    self == Red
  end
end

Color.each { |c| puts "#{c} #{c.value} #{c.warm?}" }
