def zigzag(s, rows)
  return s if rows == 1 || rows >= s.length
  lines = Array.new(rows) { +"" }
  r = 0
  step = 1
  s.each_char do |c|
    lines[r] << c
    step = 1 if r.zero?
    step = -1 if r == rows - 1
    r += step
  end
  lines.join
end

puts zigzag("PAYPALISHIRING", 3)
