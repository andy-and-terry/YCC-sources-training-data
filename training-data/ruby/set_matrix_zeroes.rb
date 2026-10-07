require 'set'

def set_zeroes!(m)
  rows = Set.new
  cols = Set.new
  m.each_with_index do |row, r|
    row.each_with_index do |v, c|
      next unless v.zero?

      rows << r
      cols << c
    end
  end
  m.each_with_index { |row, r| row.each_index { |c| row[c] = 0 if rows.include?(r) || cols.include?(c) } }
  m
end

set_zeroes!([[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]).each { |row| p row }
