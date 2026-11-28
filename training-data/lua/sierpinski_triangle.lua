local n = 8
for r = 0, n - 1 do
  local row = { string.rep(" ", n - r - 1) }
  for c = 0, r do row[#row + 1] = (r & c) == c and "* " or "  " end
  print(table.concat(row))
end
