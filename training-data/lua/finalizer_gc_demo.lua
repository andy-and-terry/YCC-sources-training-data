local log = {}
do
  local obj = setmetatable({}, {
    __gc = function() log[#log + 1] = "collected" end
  })
  obj = nil
end
collectgarbage()
collectgarbage()
print(#log, log[1])
print(type(collectgarbage("count")))
print(collectgarbage("isrunning"))
