func compute() -> Result<Int, Error> {
    Result { try Int("12").unsafelyUnwrapped * 2 }
}
switch compute() {
case .success(let v): print(v)
case .failure(let e): print(e)
}
