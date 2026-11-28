def encode(text : String, rails : Int32) : String
  rows = Array.new(rails) { String::Builder.new }
  r = 0
  step = 1
  text.each_char do |ch|
    rows[r] << ch
    step = 1 if r == 0
    step = -1 if r == rails - 1
    r += step
  end
  rows.map(&.to_s).join
end

puts encode("WEAREDISCOVERED", 3)
