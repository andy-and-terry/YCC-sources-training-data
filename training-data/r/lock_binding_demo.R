# lockBinding() and lockEnvironment() protect values from modification.
env <- new.env()
assign("limit", 100, envir = env)
lockBinding("limit", env)

res <- tryCatch({
  assign("limit", 200, envir = env)
  "changed"
}, error = function(e) "cannot change locked binding")
print(res)
print(get("limit", envir = env))

unlockBinding("limit", env)
assign("limit", 200, envir = env)
print(get("limit", envir = env))

lockEnvironment(env)
res2 <- tryCatch({
  assign("extra", 1, envir = env)
  "added"
}, error = function(e) "cannot add to locked environment")
print(res2)
print(bindingIsLocked("limit", env))
print(environmentIsLocked(env))
