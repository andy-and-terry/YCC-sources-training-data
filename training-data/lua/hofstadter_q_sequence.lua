local function hofstadter_q(count)
  local q = { 1, 1 }
  for n = 3, count do
    q[n] = q[n - q[n - 1]] + q[n - q[n - 2]]
  end
  return q
end

print(table.concat(hofstadter_q(20), " "))
