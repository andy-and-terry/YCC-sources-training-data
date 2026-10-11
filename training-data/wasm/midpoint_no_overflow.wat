(module
  ;; Average of two unsigned ints without overflow: (a & b) + ((a ^ b) >> 1)
  (func $midpoint (export "midpoint") (param $a i32) (param $b i32) (result i32)
    (i32.add
      (i32.and (local.get $a) (local.get $b))
      (i32.shr_u (i32.xor (local.get $a) (local.get $b)) (i32.const 1)))))
