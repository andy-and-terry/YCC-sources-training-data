def encode(text, rails)
  rows = Array.new(rails) { +"" }
  r = 0
  step = 1
  text.each_char do |ch|
    rows[r] << ch
    step = 1 if r.zero?
    step = -1 if r == rails - 1
    r += step
  end
  rows.join
end

puts encode("WEAREDISCOVERED", 3)
