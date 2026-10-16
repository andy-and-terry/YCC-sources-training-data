local function makeAccount(balance)
  local function deposit(n) balance = balance + n end
  local function withdraw(n)
    if n > balance then return false end
    balance = balance - n
    return true
  end
  local function get() return balance end
  return deposit, withdraw, get
end

local dep, wd, get = makeAccount(100)
dep(50)
print(wd(30), wd(500), get())

local fns = {}
for i = 1, 3 do fns[i] = function() return i end end
print(fns[1](), fns[2](), fns[3]())
