local secret = setmetatable({}, { __metatable = "locked" })
print(getmetatable(secret))
print(pcall(setmetatable, secret, {}))

local plain = setmetatable({}, {})
print(type(getmetatable(plain)))
print(getmetatable("abc").__index == string)
