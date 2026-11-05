local function risky(n)
  if n < 0 then error({code = 400, msg = "negative"}) end
  return n
end
local ok, err = pcall(risky, -1)
print(ok, type(err), err.code, err.msg)
print(select("#", pcall(risky, 5)))
