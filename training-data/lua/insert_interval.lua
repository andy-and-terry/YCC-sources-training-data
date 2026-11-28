local function insert_interval(iv, new)
  local out, i = {}, 1
  while i <= #iv and iv[i][2] < new[1] do
    out[#out + 1] = iv[i]
    i = i + 1
  end
  while i <= #iv and iv[i][1] <= new[2] do
    new = { math.min(new[1], iv[i][1]), math.max(new[2], iv[i][2]) }
    i = i + 1
  end
  out[#out + 1] = new
  while i <= #iv do
    out[#out + 1] = iv[i]
    i = i + 1
  end
  return out
end

for _, r in ipairs(insert_interval({ { 1, 3 }, { 6, 9 } }, { 2, 5 })) do
  io.write("[", r[1], ",", r[2], "] ")
end
print() -- [1,5] [6,9]
