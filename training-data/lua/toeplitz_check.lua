local function is_toeplitz(m)
  for i = 2, #m do
    for j = 2, #m[i] do
      if m[i][j] ~= m[i - 1][j - 1] then return false end
    end
  end
  return true
end

print(is_toeplitz({ { 1, 2, 3 }, { 4, 1, 2 }, { 5, 4, 1 } }))
print(is_toeplitz({ { 1, 2 }, { 2, 2 } }))
