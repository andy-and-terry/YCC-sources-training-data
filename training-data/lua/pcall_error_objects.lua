local ok, err = pcall(function() error({ code = 404, msg = "nf" }) end)
print(ok, err.code, err.msg)
print(pcall(error, "plain", 0))
print(select(2, xpcall(function() local x = nil; return x.y end, function(m) return "handled" end)))
