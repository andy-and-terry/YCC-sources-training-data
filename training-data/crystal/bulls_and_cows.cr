# Bulls and Cows scoring for equal-length digit strings.
def score(secret : String, guess : String) : Tuple(Int32, Int32)
  bulls = 0
  sc = Hash(Char, Int32).new(0)
  gc = Hash(Char, Int32).new(0)
  secret.each_char.zip(guess.each_char).each do |s, g|
    if s == g
      bulls += 1
    else
      sc[s] += 1
      gc[g] += 1
    end
  end
  cows = sc.sum { |c, n| Math.min(n, gc[c]) }
  {bulls, cows}
end

b, c = score("1807", "7810")
puts "#{b} bull(s), #{c} cow(s)"
