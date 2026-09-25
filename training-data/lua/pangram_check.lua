local function is_pangram(s)
  local seen, count = {}, 0
  for ch in s:lower():gmatch("%a") do
    if not seen[ch] then
      seen[ch] = true
      count = count + 1
    end
  end
  return count == 26
end

print(is_pangram("The quick brown fox jumps over the lazy dog"))
print(is_pangram("Hello world"))
