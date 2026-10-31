local function is_self_describing(s)
  for i = 1, #s do
    local _, count = s:gsub(tostring(i - 1), "")
    if count ~= tonumber(s:sub(i, i)) then return false end
  end
  return true
end

for _, s in ipairs({"1210", "2020", "21200", "1211"}) do
  print(s, is_self_describing(s))
end
