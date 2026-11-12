enum E: Error { case bad(Int) }
func f(_ x: Int) throws -> Int { defer { print("leaving f") }; if x < 0 { throw E.bad(x) }; return x }
do { print(try f(1)); _ = try f(-2) } catch E.bad(let n) { print("bad", n) }
