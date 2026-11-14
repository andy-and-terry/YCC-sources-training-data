local cfg = {}
for k, v in ("a=1, b=two, c=3"):gmatch("(%w+)=(%w+)") do cfg[k] = v end
local keys = {}
for k in pairs(cfg) do keys[#keys + 1] = k end
table.sort(keys)
for _, k in ipairs(keys) do print(k, cfg[k]) end
