def min_window(s, t)
  need = t.chars.tally
  need.default = 0
  missing = t.size
  best = nil
  left = 0
  s.each_char.with_index do |c, right|
    missing -= 1 if need[c].positive?
    need[c] -= 1
    while missing.zero?
      best = [left, right] if best.nil? || right - left < best[1] - best[0]
      need[s[left]] += 1
      missing += 1 if need[s[left]].positive?
      left += 1
    end
  end
  best ? s[best[0]..best[1]] : ''
end

p min_window('ADOBECODEBANC', 'ABC'), min_window('a', 'aa')
