local function trap(h)
  local l, r = 1, #h
  local lmax, rmax, total = 0, 0, 0
  while l < r do
    if h[l] < h[r] then
      lmax = math.max(lmax, h[l])
      total = total + lmax - h[l]
      l = l + 1
    else
      rmax = math.max(rmax, h[r])
      total = total + rmax - h[r]
      r = r - 1
    end
  end
  return total
end

print(trap({ 0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1 }))
print(trap({ 4, 2, 0, 3, 2, 5 }))
print(trap({ 1, 2, 3 }))
