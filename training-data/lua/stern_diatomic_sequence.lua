local function stern(count)
  local s = { 0, 1 }
  for n = 2, count - 1 do
    local half = math.floor(n / 2)
    if n % 2 == 0 then
      s[n + 1] = s[half + 1]
    else
      s[n + 1] = s[half + 1] + s[half + 2]
    end
  end
  return s
end

print(table.concat(stern(20), " "))
