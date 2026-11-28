local s, k, B, M = "abcabc", 3, 31, 1000003
local pw = 1
for _ = 2, k do pw = pw * B % M end
local h = 0
for i = 1, k do h = (h * B + s:byte(i)) % M end
print(0, h)
for i = 2, #s - k + 1 do
  h = (h - s:byte(i - 1) * pw % M + M) % M
  h = (h * B + s:byte(i + k - 1)) % M
  print(i - 1, h)
end
