def rotate_cw(m) = m.transpose.map(&:reverse)
def rotate_ccw(m) = m.transpose.reverse
def rotate_180(m) = m.reverse.map(&:reverse)

m = [[1, 2, 3, 4], [5, 6, 7, 8]]
rotate_cw(m).each { |row| p row }
p rotate_ccw(m), rotate_180(m)
p 4.times.reduce(m) { |acc, _| rotate_cw(acc) } == m
