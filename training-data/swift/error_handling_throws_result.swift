enum ParseError: Error { case empty, notNumber(String), negative(Int) }

func parse(_ s: String) throws -> Int {
    guard !s.isEmpty else { throw ParseError.empty }
    guard let n = Int(s) else { throw ParseError.notNumber(s) }
    guard n >= 0 else { throw ParseError.negative(n) }
    return n
}

for s in ["5", "", "abc", "-4"] {
    do { print(try parse(s)) }
    catch ParseError.empty { print("empty") }
    catch ParseError.notNumber(let t) { print("not a number: \(t)") }
    catch { print("other: \(error)") }
}
let r = Result { try parse("7") }
switch r { case .success(let v): print("ok \(v)"); case .failure(let e): print(e) }
print((try? parse("zz")) ?? -1, (try! parse("3")))
func cleanup() { defer { print("deferred") }; print("body") }
cleanup()
