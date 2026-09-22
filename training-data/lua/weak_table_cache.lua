local cache = setmetatable({}, { __mode = "v" })

local function make_record(name)
  return { name = name, created = os.clock() }
end

local function get_record(key, name)
  if cache[key] then
    return cache[key], true
  end
  local record = make_record(name)
  cache[key] = record
  return record, false
end

local record = get_record(1, "session-a")
print(record.name, select(2, get_record(1, "session-a")))

record = nil
collectgarbage()

if cache[1] == nil then
  print("collected")
else
  print("still cached")
end
