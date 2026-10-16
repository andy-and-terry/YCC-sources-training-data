local function validate(x)
  if type(x) ~= "number" then
    error("number expected", 2) -- blame the caller
  end
  return x
end

local function useIt()
  return validate("oops")
end

print(pcall(useIt))
print(pcall(error, "level0", 0))
print(pcall(error, "level1", 1))
