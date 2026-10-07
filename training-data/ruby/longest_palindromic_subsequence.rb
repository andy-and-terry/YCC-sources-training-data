def lps(s)
  n = s.size
  return '' if n.zero?

  memo = {}
  best = lambda do |i, j|
    return 0 if i > j
    return 1 if i == j

    memo[[i, j]] ||= s[i] == s[j] ? best.(i + 1, j - 1) + 2 : [best.(i + 1, j), best.(i, j - 1)].max
  end
  left = +''
  right = +''
  i = 0
  j = n - 1
  while i <= j
    if i == j
      left << s[i]
      break
    elsif s[i] == s[j]
      left << s[i]
      right.prepend(s[j])
      i += 1
      j -= 1
    elsif best.(i + 1, j) >= best.(i, j - 1)
      i += 1
    else
      j -= 1
    end
  end
  left + right
end

%w[bbbab character agbdba cbbd].each { |s| puts "#{s} -> #{lps(s)}" }
