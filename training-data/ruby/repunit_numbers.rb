# Repunits: numbers made only of the digit 1.
repunits = Enumerator.produce(1) { |r| r * 10 + 1 }.take(5)
puts repunits.inspect
