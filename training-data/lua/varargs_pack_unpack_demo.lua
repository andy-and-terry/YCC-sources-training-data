local function describe(...)
  local count = select("#", ...)
  print("arg count:", count)
  for i = 1, count do
    print(i, (select(i, ...)))
  end
end

describe("x", nil, "z")

local function variadic_max(...)
  local packed = table.pack(...)
  local best = packed[1]
  for i = 2, packed.n do
    if packed[i] > best then best = packed[i] end
  end
  return best
end

print(variadic_max(3, 7, 2, 9, 4))

local function sum(...)
  local total = 0
  for _, v in ipairs(table.pack(...)) do
    total = total + v
  end
  return total
end

local function forward_to_sum(...)
  return sum(...)
end

print(forward_to_sum(table.unpack({ 1, 2, 3, 4 })))

local function logged_call(fn, ...)
  local args = table.pack(...)
  io.write("calling with " .. args.n .. " args: ")
  print(fn(...))
end

logged_call(sum, 10, 20, 30)
