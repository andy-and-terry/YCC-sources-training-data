local log_line = "2024-01-15 ERROR user=42 msg=timeout; 2024-01-16 INFO user=7 msg=ok"

for date, level, user in log_line:gmatch("(%d%d%d%d%-%d%d%-%d%d) (%u+) user=(%d+)") do
  print(date, level, user)
end

local csv = "name,age,city"
local fields = {}
for field in csv:gmatch("[^,]+") do
  table.insert(fields, field)
end
print(table.concat(fields, " | "))

local masked = "credit card 4111111111111111 expires soon"
masked = masked:gsub("%d%d%d%d%d%d%d%d%d%d%d%d", "************")
print(masked)
