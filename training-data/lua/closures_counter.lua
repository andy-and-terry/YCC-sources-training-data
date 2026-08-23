local function make_counter()
  local count = 0
  return function()
    count = count + 1
    return count
  end
end

local counter1 = make_counter()
local counter2 = make_counter()
print(counter1())
print(counter1())
print(counter2())
