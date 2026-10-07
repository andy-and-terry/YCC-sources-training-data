local function moving_average(size)
  local buf, idx, count, sum = {}, 1, 0, 0
  return function(v)
    sum = sum + v - (buf[idx] or 0)
    buf[idx] = v
    idx = idx % size + 1
    count = math.min(count + 1, size)
    return sum / count
  end
end

local ma = moving_average(3)
local out = {}
for _, v in ipairs({ 1, 10, 3, 5, 8, 2 }) do out[#out + 1] = string.format("%.2f", ma(v)) end
print(table.concat(out, " "))
