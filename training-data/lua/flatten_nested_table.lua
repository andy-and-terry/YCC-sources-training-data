local function flatten(t, out)
  out = out or {}
  for _, v in ipairs(t) do
    if type(v) == "table" then
      flatten(v, out)
    else
      out[#out + 1] = v
    end
  end
  return out
end

print(table.concat(flatten({ 1, { 2, { 3, 4 }, 5 }, { { 6 } } }), ","))
