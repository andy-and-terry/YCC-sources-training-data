;; Tetrahedral numbers n(n+1)(n+2)/6
(module
  (func $term (export "term") (param $n i32) (result i32)
    local.get $n
    local.get $n
    i32.const 1
    i32.add
    i32.mul
    local.get $n
    i32.const 2
    i32.add
    i32.mul
    i32.const 6
    i32.div_u)
)
