# Reading and setting environment variables.
Sys.setenv(DEMO_MODE = "debug", DEMO_LEVEL = "3")

print(Sys.getenv("DEMO_MODE"))
print(Sys.getenv("DEMO_MISSING"))
print(Sys.getenv("DEMO_MISSING", unset = "fallback"))
print(is.na(Sys.getenv("DEMO_MISSING", unset = NA)))

level <- as.integer(Sys.getenv("DEMO_LEVEL", "1"))
print(level + 1L)

print(nzchar(Sys.getenv("DEMO_MODE")))
print(Sys.getenv(c("DEMO_MODE", "DEMO_LEVEL")))

Sys.unsetenv("DEMO_MODE")
print(Sys.getenv("DEMO_MODE", unset = "<unset>"))
