# catch/throw performs a non-local exit: throw unwinds the stack
# straight back to the matching catch, skipping any intermediate
# loops or method calls -- unlike break, which only exits one loop.
def find_pair(matrix, target)
  catch(:found) do
    matrix.each_with_index do |row, i|
      row.each_with_index do |value, j|
        throw(:found, [i, j]) if value == target
      end
    end
    nil
  end
end

grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
puts find_pair(grid, 5).inspect
puts find_pair(grid, 42).inspect

# throw can also carry no extra value, in which case catch returns nil.
outcome = catch(:done) do
  10.times do |i|
    throw(:done) if i == 3
    puts "step #{i}"
  end
  "completed normally"
end
puts outcome.inspect
