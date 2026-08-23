local function build_lps(pattern)
  local n = #pattern
  local lps = {}
  for i = 1, n do lps[i] = 0 end
  local len = 0
  local i = 2
  while i <= n do
    if pattern:sub(i, i) == pattern:sub(len + 1, len + 1) then
      len = len + 1
      lps[i] = len
      i = i + 1
    elseif len ~= 0 then
      len = lps[len]
    else
      lps[i] = 0
      i = i + 1
    end
  end
  return lps
end

local function kmp_search(text, pattern)
  local lps = build_lps(pattern)
  local n, m = #text, #pattern
  local i, j = 1, 1
  while i <= n do
    if text:sub(i, i) == pattern:sub(j, j) then
      i = i + 1
      j = j + 1
      if j > m then return i - j end
    elseif j > 1 then
      j = lps[j - 1]
    else
      i = i + 1
    end
  end
  return -1
end

print(kmp_search("abxabcabcaby", "abcaby"))
