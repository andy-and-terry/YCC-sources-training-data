local function plus_one(digits)
  local d = { table.unpack(digits) }
  for i = #d, 1, -1 do
    if d[i] < 9 then
      d[i] = d[i] + 1
      return d
    end
    d[i] = 0
  end
  table.insert(d, 1, 1)
  return d
end

print(table.concat(plus_one({1, 2, 9}), ",")) -- 1,3,0
print(table.concat(plus_one({9, 9}), ","))    -- 1,0,0
