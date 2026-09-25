def interpolation_search(a, target)
  lo = 0
  hi = a.size - 1
  while lo <= hi && target.between?(a[lo], a[hi])
    return (a[lo] == target ? lo : nil) if a[hi] == a[lo]

    pos = lo + (target - a[lo]) * (hi - lo) / (a[hi] - a[lo])
    case a[pos] <=> target
    when 0 then return pos
    when -1 then lo = pos + 1
    else hi = pos - 1
    end
  end
  nil
end

a = [10, 12, 13, 16, 18, 19, 20, 21, 22, 23, 24, 33, 35, 42, 47]
p [interpolation_search(a, 18), interpolation_search(a, 25)]
