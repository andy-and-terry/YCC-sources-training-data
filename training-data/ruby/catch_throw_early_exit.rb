result = catch(:found) do
  (1..5).each do |i|
    (1..5).each do |j|
      throw :found, [i, j] if i * j == 12
    end
  end
  nil
end
puts result.inspect
