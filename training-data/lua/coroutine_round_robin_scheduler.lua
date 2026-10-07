-- A cooperative scheduler that runs coroutines in round-robin order.
local Scheduler = { tasks = {} }

function Scheduler.spawn(name, fn)
  Scheduler.tasks[#Scheduler.tasks + 1] = { name = name, co = coroutine.create(fn) }
end

function Scheduler.run()
  while #Scheduler.tasks > 0 do
    for i = #Scheduler.tasks, 1, -1 do
      local task = Scheduler.tasks[i]
      local ok, err = coroutine.resume(task.co)
      if not ok then print(task.name .. " failed: " .. tostring(err)) end
      if coroutine.status(task.co) == "dead" then
        print(task.name .. " finished")
        table.remove(Scheduler.tasks, i)
      end
    end
  end
end

local function worker(label, steps)
  return function()
    for i = 1, steps do
      print(label .. " step " .. i)
      coroutine.yield()
    end
  end
end

Scheduler.spawn("A", worker("A", 2))
Scheduler.spawn("B", worker("B", 3))
Scheduler.spawn("C", function() coroutine.yield(); error("oops") end)
Scheduler.run()
