local function cosine(a, b)
  local dot, na, nb = 0, 0, 0
  for i = 1, #a do
    dot = dot + a[i] * b[i]
    na = na + a[i] ^ 2
    nb = nb + b[i] ^ 2
  end
  if na == 0 or nb == 0 then return 0 end
  return dot / (math.sqrt(na) * math.sqrt(nb))
end

print(string.format("%.4f", cosine({1, 2, 3}, {4, 5, 6})))
