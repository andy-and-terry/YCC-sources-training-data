local fixed = 86400 * 365 -- 1971-01-01 00:00:00 UTC

print(os.date("!%Y-%m-%d %H:%M:%S", fixed))
print(os.date("!%A, %B %d", fixed))
print(os.date("!%j %U %p", fixed))

local t = os.date("!*t", fixed + 3661)
print(t.year, t.month, t.day, t.hour, t.min, t.sec, t.wday, t.yday)

local stamp = os.time({ year = 2024, month = 2, day = 28, hour = 12 })
local later = os.time({ year = 2024, month = 2, day = 28 + 2, hour = 12 })
print(os.difftime(later, stamp) / 86400, "days")

local normalized = os.date("*t", os.time({ year = 2024, month = 14, day = 35, hour = 12 }))
print(normalized.year, normalized.month, normalized.day)

local start = os.clock()
local sum = 0
for i = 1, 1e6 do sum = sum + i end
local elapsed = os.clock() - start
print(sum, elapsed >= 0, type(os.time()))

print(type(os.getenv("HOME")), os.getenv("SURELY_NOT_SET_VAR"))
print(os.tmpname() ~= nil)
