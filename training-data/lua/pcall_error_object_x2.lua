local ok, err = pcall(function() error({ code = 404, msg = "not found" }) end)
print(ok, err.code, err.msg)
