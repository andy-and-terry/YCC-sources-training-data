local to_c = {
  C = function(v) return v end,
  F = function(v) return (v - 32) * 5 / 9 end,
  K = function(v) return v - 273.15 end,
}
local from_c = {
  C = function(v) return v end,
  F = function(v) return v * 9 / 5 + 32 end,
  K = function(v) return v + 273.15 end,
}

local function convert(v, from, to)
  assert(to_c[from] and from_c[to], "unknown unit")
  return from_c[to](to_c[from](v))
end

print(string.format("%.2f %.2f", convert(100, "C", "F"), convert(212, "F", "K")))
