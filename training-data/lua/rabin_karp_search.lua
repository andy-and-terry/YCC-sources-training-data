-- Rabin-Karp substring search: hash the pattern once, then slide a
-- rolling hash across the text so most positions are rejected in O(1).
local BASE = 256
local MODULUS = 1000000007

local function rabin_karp(text, pattern)
  local matches = {}
  local n, m = #text, #pattern
  if m == 0 or m > n then return matches end

  local pattern_hash, window_hash, high_order = 0, 0, 1
  for i = 1, m - 1 do
    high_order = (high_order * BASE) % MODULUS
  end

  for i = 1, m do
    pattern_hash = (pattern_hash * BASE + pattern:byte(i)) % MODULUS
    window_hash = (window_hash * BASE + text:byte(i)) % MODULUS
  end

  for i = 1, n - m + 1 do
    if window_hash == pattern_hash and text:sub(i, i + m - 1) == pattern then
      table.insert(matches, i)
    end
    if i <= n - m then
      window_hash = (window_hash - text:byte(i) * high_order % MODULUS) % MODULUS
      window_hash = (window_hash * BASE + text:byte(i + m)) % MODULUS
      window_hash = (window_hash + MODULUS) % MODULUS
    end
  end

  return matches
end

local text = "abracadabra abracadabra"
local matches = rabin_karp(text, "abra")
print(table.concat(matches, ", "))
print(#rabin_karp(text, "cad"))
print(#rabin_karp(text, "xyz"))
