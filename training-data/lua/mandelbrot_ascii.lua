local function escape(cr, ci)
  local zr, zi = 0, 0
  for n = 0, 29 do
    if zr * zr + zi * zi >= 4 then return n end
    zr, zi = zr * zr - zi * zi + cr, 2 * zr * zi + ci
  end
  return 30
end

for yi = -5, 5 do
  local row = {}
  for xi = -40, 12 do row[#row + 1] = escape(xi / 20, yi / 5) == 30 and "#" or "." end
  print(table.concat(row))
end
