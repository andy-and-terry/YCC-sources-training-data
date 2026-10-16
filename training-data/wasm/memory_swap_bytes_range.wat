(module
  (memory (export "memory") 1)

  ;; Swap two bytes in linear memory.
  (func $swap (export "swap") (param $i i32) (param $j i32)
    (local $t i32)
    (local.set $t (i32.load8_u (local.get $i)))
    (i32.store8 (local.get $i) (i32.load8_u (local.get $j)))
    (i32.store8 (local.get $j) (local.get $t)))
)
