local obj = { n = 5 }
function obj.plain(self, x) return self.n + x end
function obj:colon(x) return self.n + x end

print(obj.plain(obj, 1), obj:plain(1))
print(obj.colon(obj, 2), obj:colon(2))
print(("abc"):upper(), string.upper("abc"))
print(#"hello", ("x"):rep(3))
