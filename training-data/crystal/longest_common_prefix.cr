def longest_common_prefix(strs : Array(String)) : String
  return "" if strs.empty?

  prefix = strs[0]
  strs[1..].each do |s|
    while !s.starts_with?(prefix)
      prefix = prefix[0...-1]
      return "" if prefix.empty?
    end
  end

  prefix
end

puts longest_common_prefix(["flower", "flow", "flight"])
puts longest_common_prefix(["dog", "racecar", "car"])
