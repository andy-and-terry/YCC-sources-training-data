local function mod_inverse(a, m)
  for x = 1, m - 1 do
    if a * x % m == 1 then return x end
  end
end

local function affine(s, a, b, decrypt)
  local inv = mod_inverse(a, 26)
  return (s:gsub("%u", function(ch)
    local x = ch:byte() - 65
    local y = decrypt and (inv * (x - b)) % 26 or (a * x + b) % 26
    return string.char(y + 65)
  end))
end

local c = affine("AFFINE", 5, 8)
print(c, affine(c, 5, 8, true))
