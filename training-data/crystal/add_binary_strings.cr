def add_binary(a : String, b : String) : String
  i, j, carry = a.size - 1, b.size - 1, 0
  out = [] of Int32
  while i >= 0 || j >= 0 || carry > 0
    sum = carry
    if i >= 0
      sum += a[i].to_i
      i -= 1
    end
    if j >= 0
      sum += b[j].to_i
      j -= 1
    end
    out << sum % 2
    carry = sum // 2
  end
  out.reverse.join
end

puts add_binary("1010", "1011") # 10101
