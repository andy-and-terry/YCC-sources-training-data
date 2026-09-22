local function tokenize_expr(expr)
  local tokens = {}
  local pos = 1
  while pos <= #expr do
    local c = expr:sub(pos, pos)
    if c:match("%s") then
      pos = pos + 1
    elseif c:match("%d") then
      local s, e = expr:find("%d+%.?%d*", pos)
      table.insert(tokens, { type = "number", value = tonumber(expr:sub(s, e)) })
      pos = e + 1
    elseif c:match("[%+%-%*/%(%)]") then
      table.insert(tokens, { type = "op", value = c })
      pos = pos + 1
    else
      error("unexpected character: " .. c)
    end
  end
  return tokens
end

local tokens = tokenize_expr("12 + 3 * (4 - 1.5)")
for _, tok in ipairs(tokens) do
  print(tok.type, tok.value)
end
