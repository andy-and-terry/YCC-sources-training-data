local states = {}

states.locked = {
  name = "locked",
  coin = function(context) context.state = states.unlocked end,
  push = function(context) print("still locked") end,
}

states.unlocked = {
  name = "unlocked",
  coin = function(context) print("already unlocked") end,
  push = function(context) context.state = states.locked end,
}

local Turnstile = {}
Turnstile.__index = Turnstile

function Turnstile.new()
  return setmetatable({ state = states.locked }, Turnstile)
end

function Turnstile:coin()
  self.state.coin(self)
  print("state -> " .. self.state.name)
end

function Turnstile:push()
  self.state.push(self)
  print("state -> " .. self.state.name)
end

local turnstile = Turnstile.new()
turnstile:push()
turnstile:coin()
turnstile:push()
