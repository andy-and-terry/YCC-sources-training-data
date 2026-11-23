;; 6n(n-1)+1
(module
  (func $term (export "term") (param $n i32) (result i32)
    i32.const 6
    local.get $n
    i32.mul
    local.get $n
    i32.const 1
    i32.sub
    i32.mul
    i32.const 1
    i32.add))
