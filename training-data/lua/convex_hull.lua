local function cross(o, a, b)
  return (a[1] - o[1]) * (b[2] - o[2]) - (a[2] - o[2]) * (b[1] - o[1])
end

local function half_hull(pts)
  local h = {}
  for _, q in ipairs(pts) do
    while #h >= 2 and cross(h[#h - 1], h[#h], q) <= 0 do
      table.remove(h)
    end
    h[#h + 1] = q
  end
  table.remove(h)
  return h
end

-- Andrew's monotone chain, counter-clockwise result
local function convex_hull(points)
  local p = { table.unpack(points) }
  table.sort(p, function(a, b)
    if a[1] ~= b[1] then return a[1] < b[1] end
    return a[2] < b[2]
  end)
  local rev = {}
  for i = #p, 1, -1 do rev[#rev + 1] = p[i] end
  local hull = half_hull(p)
  for _, q in ipairs(half_hull(rev)) do hull[#hull + 1] = q end
  return hull
end

for _, q in ipairs(convex_hull({ {0, 0}, {2, 0}, {1, 1}, {2, 2}, {0, 2}, {1, 3} })) do
  print(q[1], q[2])
end
