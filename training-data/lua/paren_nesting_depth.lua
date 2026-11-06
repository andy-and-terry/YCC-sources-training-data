-- Maximum nesting depth of parentheses; -1 if the string is unbalanced.
local function max_depth(s)
  local depth, best = 0, 0
  for ch in s:gmatch(".") do
    if ch == "(" then
      depth = depth + 1
      best = math.max(best, depth)
    elseif ch == ")" then
      depth = depth - 1
      if depth < 0 then return -1 end
    end
  end
  return depth == 0 and best or -1
end

print(max_depth("(1+(2*(3)))"), max_depth("(()"))
