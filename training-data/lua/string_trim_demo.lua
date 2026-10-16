local function trim(s)
  return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function trimMatch(s)
  return s:match("^%s*(.-)%s*$")
end

print("[" .. trim("   hello world \t\n") .. "]")
print("[" .. trimMatch("  padded  ") .. "]")
print("[" .. trim("") .. "]")
