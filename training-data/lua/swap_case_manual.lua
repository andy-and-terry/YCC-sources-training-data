local function swap_case(s)
  return (s:gsub("%a", function(c)
    if c:match("%u") then return c:lower() else return c:upper() end
  end))
end

print(swap_case("Hello World 42"))
