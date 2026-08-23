local function normalize(s)
  local chars = {}
  for c in s:lower():gsub(" ", ""):gmatch(".") do
    table.insert(chars, c)
  end
  table.sort(chars)
  return table.concat(chars)
end

local function is_anagram(a, b)
  return normalize(a) == normalize(b)
end

print(is_anagram("listen", "silent"))
print(is_anagram("hello", "world"))
