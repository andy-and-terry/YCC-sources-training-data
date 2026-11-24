(module
  ;; Pentagonal numbers: n(3n-1)/2.  pentagonal(10) == 145
  (func (export "pentagonal") (param $n i32) (result i32)
    (i32.div_u
      (i32.mul (local.get $n)
               (i32.sub (i32.mul (local.get $n) (i32.const 3)) (i32.const 1)))
      (i32.const 2))))
