def ternary_search(a, target)
  lo = 0
  hi = a.size - 1
  while lo <= hi
    m1 = lo + (hi - lo) / 3
    m2 = hi - (hi - lo) / 3
    return m1 if a[m1] == target
    return m2 if a[m2] == target

    if target < a[m1]
      hi = m1 - 1
    elsif target > a[m2]
      lo = m2 + 1
    else
      lo = m1 + 1
      hi = m2 - 1
    end
  end
  nil
end

def argmax(lo, hi, iterations: 200)
  iterations.times do
    m1 = lo + (hi - lo) / 3.0
    m2 = hi - (hi - lo) / 3.0
    yield(m1) < yield(m2) ? lo = m1 : hi = m2
  end
  (lo + hi) / 2
end

p ternary_search([1, 3, 5, 7, 9, 11, 13], 9)
p ternary_search([1, 3, 5], 4)
puts format('%.6f %.6f', argmax(-10.0, 10.0) { |x| -(x - 2)**2 + 3 }, argmax(0.0, 3.0) { |x| Math.sin(x) })
