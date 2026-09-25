local function is_rotation(a, b)
  return #a == #b and (a .. a):find(b, 1, true) ~= nil
end

print(is_rotation("waterbottle", "erbottlewat"))
print(is_rotation("abc", "acb"))
