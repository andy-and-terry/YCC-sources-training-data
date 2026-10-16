(module
  ;; Isolate the lowest set bit: n & -n
  (func $lowest_set_bit (export "lowest_set_bit") (param $n i32) (result i32)
    (i32.and (local.get $n) (i32.sub (i32.const 0) (local.get $n)))))
