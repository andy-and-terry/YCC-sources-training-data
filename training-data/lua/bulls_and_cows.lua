-- Bulls and Cows scoring for equal-length digit strings.
local function score(secret, guess)
  local bulls, cows = 0, 0
  local sc, gc = {}, {}
  for i = 1, #secret do
    local s, g = secret:sub(i, i), guess:sub(i, i)
    if s == g then
      bulls = bulls + 1
    else
      sc[s] = (sc[s] or 0) + 1
      gc[g] = (gc[g] or 0) + 1
    end
  end
  for c, n in pairs(sc) do cows = cows + math.min(n, gc[c] or 0) end
  return bulls, cows
end

local b, c = score("1807", "7810")
print(string.format("%d bull(s), %d cow(s)", b, c))
