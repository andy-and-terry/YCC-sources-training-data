def digital_root_iter(n)
  n = n.digits.sum while n >= 10
  n
end

def digital_root(n) = n.zero? ? 0 : 1 + (n - 1) % 9

[0, 16, 942, 132_189, 493_193, 2**200].each do |n|
  puts "#{n} -> #{digital_root(n)} #{digital_root(n) == digital_root_iter(n) ? 'ok' : 'MISMATCH'}"
end
