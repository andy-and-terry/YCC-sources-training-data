;; Pronic numbers n(n+1)
(module
  (func $term (export "term") (param $n i32) (result i32)
    local.get $n
    local.get $n
    i32.const 1
    i32.add
    i32.mul)
)
