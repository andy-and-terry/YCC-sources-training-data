module Loud
  def speak(text)
    super(text.upcase)
  end
end

class Animal
  def speak(text)
    "the animal says: #{text}"
  end
end

class Dog < Animal
  prepend Loud

  def speak(text)
    super("woof, #{text}")
  end
end

# prepend inserts the module *before* Dog in the ancestor chain, so
# Loud#speak runs first and its `super` call reaches Dog#speak, not
# Animal#speak directly -- the opposite ordering `include` would give.
puts Dog.ancestors.first(3).inspect
puts Dog.new.speak("hello")
