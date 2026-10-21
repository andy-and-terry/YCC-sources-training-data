def kaprekar_steps(n)
  steps = 0
  until n == 6174
    d = format("%04d", n).chars.sort
    n = d.reverse.join.to_i - d.join.to_i
    steps += 1
  end
  steps
end

puts kaprekar_steps(3524)
