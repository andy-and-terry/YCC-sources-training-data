# Bulls and Cows scoring for equal-length digit strings.
def score(secret, guess)
  pairs = secret.chars.zip(guess.chars)
  bulls = pairs.count { |s, g| s == g }
  rest = pairs.reject { |s, g| s == g }
  sc = rest.map(&:first).tally
  gc = rest.map(&:last).tally
  cows = sc.sum { |c, n| [n, gc.fetch(c, 0)].min }
  [bulls, cows]
end

bulls, cows = score("1807", "7810")
puts "#{bulls} bull(s), #{cows} cow(s)"
