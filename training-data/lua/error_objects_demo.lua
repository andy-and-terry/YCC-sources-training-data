local function fail(code)
  error({ code = code, message = "failure " .. code })
end

local ok, err = pcall(fail, 404)
print(ok, type(err), err.code, err.message)

local ok2, err2 = pcall(error, "plain", 0)
print(ok2, err2)

local ok3, err3 = pcall(error)
print(ok3, err3)

print(select(2, pcall(function() local x = nil; return x.field end)))
