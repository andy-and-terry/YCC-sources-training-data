local handlers = {}
local function onStart() return "start" end
local function onStop() return "stop" end
handlers[onStart] = "S"
handlers[onStop] = "T"
print(handlers[onStart], handlers[onStop])

local seen = {}
local function once(f)
  if seen[f] then return "already" end
  seen[f] = true
  return f()
end
print(once(onStart), once(onStart))
