local function rot47(s)
  return (s:gsub("[!-~]", function(c)
    return string.char(33 + (c:byte() - 33 + 47) % 94)
  end))
end

local e = rot47("Hello, World!")
print(e, rot47(e))
