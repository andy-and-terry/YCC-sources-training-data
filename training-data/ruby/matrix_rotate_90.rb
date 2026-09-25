def rotate_clockwise(m)
  m.transpose.map(&:reverse)
end

def rotate_counter_clockwise(m)
  m.map(&:reverse).transpose
end

m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
p rotate_clockwise(m)
p rotate_counter_clockwise(m)
