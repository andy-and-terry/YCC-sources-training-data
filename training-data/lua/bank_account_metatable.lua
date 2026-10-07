local Account = {}
Account.__index = Account

function Account.new(balance)
  return setmetatable({ balance = balance or 0, log = {} }, Account)
end

function Account:deposit(amount)
  assert(amount > 0, "amount must be positive")
  self.balance = self.balance + amount
  self.log[#self.log + 1] = "deposit " .. amount
end

function Account:withdraw(amount)
  if amount > self.balance then
    error({ code = "INSUFFICIENT", requested = amount, available = self.balance })
  end
  self.balance = self.balance - amount
  self.log[#self.log + 1] = "withdraw " .. amount
end

Account.__tostring = function(a) return "Account(" .. a.balance .. ")" end

local a = Account.new(100)
a:deposit(50)
a:withdraw(30)
local ok, err = pcall(a.withdraw, a, 1000)
print(tostring(a), ok, err.code, err.available)
print(table.concat(a.log, ", "))
