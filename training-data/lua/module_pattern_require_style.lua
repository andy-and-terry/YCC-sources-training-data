local M = {}
local private_count = 0
function M.increment() private_count = private_count + 1; return private_count end
function M.reset() private_count = 0 end
M.VERSION = "1.0"
local Stack = {}
Stack.__index = Stack
function M.newStack() return setmetatable({ items = {}, size = 0 }, Stack) end
function Stack:push(v) self.size = self.size + 1; self.items[self.size] = v; return self end
function Stack:pop() local v = self.items[self.size]; self.items[self.size] = nil; self.size = self.size - 1; return v end
print(M.increment(), M.increment(), M.VERSION)
local s = M.newStack():push(1):push(2)
print(s:pop(), s.size)
package.loaded["mymod"] = M
print(require("mymod") == M, package.loaded["mymod"].VERSION)
