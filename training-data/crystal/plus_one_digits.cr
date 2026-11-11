def plus_one(digits : Array(Int32)) : Array(Int32)
  d = digits.dup
  (d.size - 1).downto(0) do |i|
    if d[i] < 9
      d[i] += 1
      return d
    end
    d[i] = 0
  end
  d.unshift(1)
end

p plus_one([1, 2, 9]) # [1, 3, 0]
p plus_one([9, 9])    # [1, 0, 0]
