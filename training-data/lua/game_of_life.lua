local function step(grid, n)
  local nxt = {}
  for y = 1, n do
    nxt[y] = {}
    for x = 1, n do
      local count = 0
      for dy = -1, 1 do
        for dx = -1, 1 do
          if dx ~= 0 or dy ~= 0 then
            local row = grid[(y + dy - 1) % n + 1]
            count = count + row[(x + dx - 1) % n + 1]
          end
        end
      end
      local alive = grid[y][x] == 1
      nxt[y][x] = ((alive and (count == 2 or count == 3)) or (not alive and count == 3)) and 1 or 0
    end
  end
  return nxt
end

local n = 6
local grid = {}
for y = 1, n do grid[y] = {} for x = 1, n do grid[y][x] = 0 end end
for _, p in ipairs({ { 1, 2 }, { 2, 3 }, { 3, 1 }, { 3, 2 }, { 3, 3 } }) do grid[p[1]][p[2]] = 1 end

for gen = 1, 3 do
  print("Generation " .. gen)
  for y = 1, n do
    print((table.concat(grid[y]):gsub("1", "#"):gsub("0", ".")))
  end
  grid = step(grid, n)
end
