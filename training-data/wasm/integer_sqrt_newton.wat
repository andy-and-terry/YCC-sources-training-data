(module
  ;; Integer square root (floor) using Newton's method
  (func (export "isqrt") (param $n i32) (result i32)
    (local $x i32)
    (local $y i32)
    (if (i32.lt_u (local.get $n) (i32.const 2))
      (then (return (local.get $n))))
    (local.set $x (local.get $n))
    (local.set $y (i32.shr_u (i32.add (local.get $x) (i32.const 1)) (i32.const 1)))
    (block $done
      (loop $iter
        (br_if $done (i32.ge_u (local.get $y) (local.get $x)))
        (local.set $x (local.get $y))
        (local.set $y
          (i32.shr_u
            (i32.add
              (local.get $x)
              (i32.div_u (local.get $n) (local.get $x)))
            (i32.const 1)))
        (br $iter)))
    (local.get $x))
)
