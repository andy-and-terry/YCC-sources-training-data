local function order(n, k)
  local cycle = 2 * (k - 1)
  local function rail(i) local r = i % cycle; return r < k and r or cycle - r end
  local idx = {}
  for i = 0, n - 1 do idx[#idx + 1] = i end
  table.sort(idx, function(a, b)
    if rail(a) ~= rail(b) then return rail(a) < rail(b) end
    return a < b
  end)
  return idx
end

local function encrypt(t, k)
  local out = {}
  for _, i in ipairs(order(#t, k)) do out[#out + 1] = t:sub(i + 1, i + 1) end
  return table.concat(out)
end

local function decrypt(c, k)
  local out = {}
  for pos, i in ipairs(order(#c, k)) do out[i + 1] = c:sub(pos, pos) end
  return table.concat(out)
end

local c = encrypt("WEAREDISCOVERED", 3)
print(c, decrypt(c, 3))
