local a = { 5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5 }
local bs, blk = 4, {}
for i, v in ipairs(a) do
  local b = (i - 1) // bs + 1
  blk[b] = (blk[b] or 0) + v
end

local function query(l, r) -- 1-based inclusive
  local s, i = 0, l
  while i <= r do
    if (i - 1) % bs == 0 and i + bs - 1 <= r then
      s = s + blk[(i - 1) // bs + 1]; i = i + bs
    else
      s = s + a[i]; i = i + 1
    end
  end
  return s
end

print(query(3, 10))
