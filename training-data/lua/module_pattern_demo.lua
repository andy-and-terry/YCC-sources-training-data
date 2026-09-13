local M = {}

local function validate(n)
  if type(n) ~= "number" then
    error("expected a number")
  end
end

function M.double(n)
  validate(n)
  return n * 2
end

function M.square(n)
  validate(n)
  return n * n
end

M.version = "1.0"

print(M.double(4))
print(M.square(5))
print(M.version)

return M
