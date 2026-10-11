print(pcall(assert, false))
print(pcall(assert, nil, "custom message"))
print(pcall(assert, false, { code = 1 }))
print(assert(1 == 1, "unused"))
print(select("#", assert(1, 2, 3)))

local function readNumber(s)
  return assert(tonumber(s), "not a number: " .. tostring(s))
end
print(pcall(readNumber, "12"))
print(pcall(readNumber, "x"))
