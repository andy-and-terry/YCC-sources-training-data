local function encode(xs)
  local d = {xs[1]}
  for i = 2, #xs do d[i] = xs[i] - xs[i - 1] end
  return d
end

local function decode(ds)
  local out, acc = {}, 0
  for i, d in ipairs(ds) do acc = acc + d; out[i] = acc end
  return out
end

local d = encode({10, 12, 15, 15, 20})
print(table.concat(d, " "))
print(table.concat(decode(d), " "))
