local t = os.time({ year = 2024, month = 3, day = 15, hour = 12, min = 30, sec = 0 })
print(os.date("!%Y-%m-%d", 0))
print(os.date("%Y-%m-%d %H:%M", t) ~= nil)

local d = os.date("*t", t)
print(d.year, d.month, d.day, d.wday, d.yday)

local later = os.time({ year = 2024, month = 3, day = 15 + 30, hour = 12 })
print(os.difftime(later, t) / 86400)

local normalized = os.date("*t", os.time({ year = 2024, month = 14, day = 1, hour = 12 }))
print(normalized.year, normalized.month)

local start = os.clock()
local s = 0
for i = 1, 1e5 do s = s + i end
print(s, os.clock() - start >= 0)
print(type(os.getenv("PATH")), os.getenv("NO_SUCH_VAR_XYZ"))
