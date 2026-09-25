local function luhn_valid(input)
  local s = input:gsub("%s", "")
  if #s < 2 or s:find("%D") then return false end
  local sum = 0
  for i = 1, #s do
    local d = tonumber(s:sub(#s - i + 1, #s - i + 1))
    if i % 2 == 0 then
      d = d * 2
      if d > 9 then d = d - 9 end
    end
    sum = sum + d
  end
  return sum % 10 == 0
end

print(luhn_valid("4539 3195 0343 6467"), luhn_valid("8273 1232 7352 0569"))
