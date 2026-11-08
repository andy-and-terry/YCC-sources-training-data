local function risky(n)
  if n < 0 then error({code = 42, msg = "negative"}) end
  return math.sqrt(n)
end

for _, n in ipairs({4, -1}) do
  local ok, res = pcall(risky, n)
  if ok then print("ok", res) else print("fail", res.code, res.msg) end
end
print(select(2, pcall(error, "plain", 0)))
