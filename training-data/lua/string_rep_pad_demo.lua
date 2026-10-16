local function padLeft(s, n, ch)
  return string.rep(ch or " ", n - #s) .. s
end

local function padRight(s, n, ch)
  return s .. string.rep(ch or " ", n - #s)
end

print("[" .. padLeft("42", 6, "0") .. "]")
print("[" .. padRight("ab", 5, ".") .. "]")
print(string.rep("-", 20))
print(string.rep("ab", 3, ","))
