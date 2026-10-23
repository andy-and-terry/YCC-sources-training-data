-- Parse CSV lines, handling quoted fields that contain commas and
-- doubled quotes (""), which a simple gmatch split cannot handle.
local function parse_line(line)
  local fields = {}
  local pos = 1
  while pos <= #line + 1 do
    local c = line:sub(pos, pos)
    if c == '"' then
      local value = {}
      pos = pos + 1
      while true do
        local q = line:find('"', pos, true)
        if not q then error("unterminated quoted field") end
        value[#value + 1] = line:sub(pos, q - 1)
        if line:sub(q + 1, q + 1) == '"' then
          value[#value + 1] = '"'
          pos = q + 2
        else
          pos = q + 1
          break
        end
      end
      fields[#fields + 1] = table.concat(value)
      pos = pos + 1 -- skip the comma after the closing quote
    else
      local comma = line:find(",", pos, true)
      if comma then
        fields[#fields + 1] = line:sub(pos, comma - 1)
        pos = comma + 1
      else
        fields[#fields + 1] = line:sub(pos)
        break
      end
    end
  end
  return fields
end

local samples = {
  'a,b,c',
  'name,"Smith, John",42',
  '"say ""hi""",x,',
  ',,',
}
for _, line in ipairs(samples) do
  local f = parse_line(line)
  print(#f, table.concat(f, "|"))
end
