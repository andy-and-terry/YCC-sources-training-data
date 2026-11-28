def duval(s)
  out = []
  i = 0
  while i < s.size
    j, k = i + 1, i
    while j < s.size && s[k] <= s[j]
      k = s[k] < s[j] ? i : k + 1
      j += 1
    end
    while i <= k
      out << s[i, j - k]
      i += j - k
    end
  end
  out
end

p duval("banana")
