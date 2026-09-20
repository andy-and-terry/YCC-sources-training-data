local function print_skipping_multiples_of(n, skip)
  for i = 1, n do
    if i % skip == 0 then goto continue end
    io.write(i, " ")
    ::continue::
  end
  io.write("\n")
end

print_skipping_multiples_of(15, 3)

local matrix = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } }

do
  local found_row, found_col
  for i = 1, #matrix do
    for j = 1, #matrix[i] do
      if matrix[i][j] == 5 then
        found_row, found_col = i, j
        goto found
      end
    end
  end
  ::found::
  print(found_row, found_col)
end
