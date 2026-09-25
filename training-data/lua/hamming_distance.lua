local function hamming(a, b)
  if #a ~= #b then error("strands must be of equal length") end
  local d = 0
  for i = 1, #a do
    if a:byte(i) ~= b:byte(i) then d = d + 1 end
  end
  return d
end

print(hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"))
print(pcall(hamming, "AB", "A"))
