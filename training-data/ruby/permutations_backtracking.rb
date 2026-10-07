def permutations(elements, path = [], result = [])
  if path.size == elements.size
    result << path.dup
    return result
  end

  elements.each do |element|
    next if path.include?(element)

    path << element
    permutations(elements, path, result)
    path.pop
  end

  result
end

puts permutations([1, 2, 3]).inspect
puts permutations(['a', 'b']).inspect
