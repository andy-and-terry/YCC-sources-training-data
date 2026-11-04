local function wrap(text, width)
  local lines, line = {}, ""
  for word in text:gmatch("%S+") do
    if #line > 0 and #line + 1 + #word > width then
      lines[#lines + 1] = line
      line = word
    else
      line = (#line > 0) and (line .. " " .. word) or word
    end
  end
  if #line > 0 then lines[#lines + 1] = line end
  return lines
end

for _, l in ipairs(wrap("the quick brown fox jumps over the lazy dog", 15)) do
  print(("|%-15s|"):format(l))
end
