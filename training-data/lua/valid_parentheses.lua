local function is_valid(s)
  local stack = {}
  local pairs_map = { [")"] = "(", ["]"] = "[", ["}"] = "{" }
  for i = 1, #s do
    local c = s:sub(i, i)
    if c == "(" or c == "[" or c == "{" then
      table.insert(stack, c)
    elseif c == ")" or c == "]" or c == "}" then
      if #stack == 0 or stack[#stack] ~= pairs_map[c] then
        return false
      end
      table.remove(stack)
    end
  end
  return #stack == 0
end

print(is_valid("{[()]}"))
print(is_valid("{[(])}"))
