local codes = {}
for letters, d in pairs({ bfpv = "1", cgjkqsxz = "2", dt = "3", l = "4", mn = "5", r = "6" }) do
  for c in letters:gmatch(".") do codes[c] = d end
end

local function soundex(word)
  local w = word:lower()
  local out = { w:sub(1, 1):upper() }
  local last = codes[w:sub(1, 1)]
  for ch in w:sub(2):gmatch(".") do
    local code = codes[ch]
    if code and code ~= last then out[#out + 1] = code end
    if ch ~= "h" and ch ~= "w" then last = code end
  end
  return (table.concat(out) .. "000"):sub(1, 4)
end

for _, n in ipairs({ "Robert", "Rupert", "Tymczak", "Pfister", "Honeyman" }) do
  print(n, soundex(n))
end
