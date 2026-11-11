def plus_one(digits)
  out = digits.dup
  (out.size - 1).downto(0) do |i|
    if out[i] < 9
      out[i] += 1
      return out
    end
    out[i] = 0
  end
  [1] + out
end

p plus_one([1, 2, 9]) # [1, 3, 0]
p plus_one([9, 9])    # [1, 0, 0]
