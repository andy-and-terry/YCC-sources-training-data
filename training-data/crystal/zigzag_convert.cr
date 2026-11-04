def zigzag(s : String, rows : Int32) : String
  return s if rows == 1 || rows >= s.size
  lines = Array.new(rows) { String::Builder.new }
  r, step = 0, 1
  s.each_char do |c|
    lines[r] << c
    step = 1 if r == 0
    step = -1 if r == rows - 1
    r += step
  end
  lines.map(&.to_s).join
end

puts zigzag("PAYPALISHIRING", 3)
