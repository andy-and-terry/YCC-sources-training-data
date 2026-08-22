local function safeDivide(a, b)
  if b == 0 then
    error("division by zero")
  end
  return a / b
end

local ok, result = pcall(safeDivide, 10, 2)
print(ok, result)

local ok2, err = pcall(safeDivide, 5, 0)
print(ok2, err)
