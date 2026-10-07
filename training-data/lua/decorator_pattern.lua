-- Function composition acts as the decorator: each wrapper adds behavior
-- around the base coffee maker without subclassing anything.
local function plain_coffee()
  return "coffee", 2.0
end

local function with_milk(base)
  return function()
    local desc, price = base()
    return desc .. " + milk", price + 0.5
  end
end

local function with_sugar(base)
  return function()
    local desc, price = base()
    return desc .. " + sugar", price + 0.2
  end
end

local order = with_sugar(with_milk(plain_coffee))
local desc, price = order()
print(desc, price)
