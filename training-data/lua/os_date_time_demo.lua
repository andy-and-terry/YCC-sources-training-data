-- os.time / os.date / os.difftime with a fixed UTC-independent table.
local t = os.time({ year = 2024, month = 3, day = 15, hour = 12, min = 30, sec = 0 })
print(type(t), math.type(t))

local d = os.date("*t", t)
print(d.year, d.month, d.day, d.hour, d.min)
print(d.yday, d.wday, d.isdst)

print(os.date("%Y-%m-%d %H:%M", t))
print(os.date("%A %B", t))

local later = os.time({ year = 2024, month = 3, day = 20, hour = 12, min = 30, sec = 0 })
print(os.difftime(later, t) / 86400)

-- normalisation: day 35 rolls into the next month
local norm = os.date("*t", os.time({ year = 2024, month = 1, day = 35, hour = 12 }))
print(norm.year, norm.month, norm.day)

local start = os.clock()
local sum = 0
for i = 1, 1e5 do sum = sum + i end
print(sum, os.clock() - start >= 0)

print(os.getenv("HOME") ~= nil, os.getenv("NOPE_NOT_SET"))
print(type(os.tmpname()))
