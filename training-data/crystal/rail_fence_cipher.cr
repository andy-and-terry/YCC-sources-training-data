def rail_fence(s : String, rails : Int32) : String
  rows = Array.new(rails) { String::Builder.new }
  r = 0
  dir = 1
  s.each_char do |c|
    rows[r] << c
    dir = 1 if r == 0
    dir = -1 if r == rails - 1
    r += dir
  end
  rows.map(&.to_s).join
end

puts rail_fence("WEAREDISCOVERED", 3)
