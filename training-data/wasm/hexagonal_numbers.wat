(module
  ;; Hexagonal numbers: n(2n-1).  hexagonal(10) == 190
  (func (export "hexagonal") (param $n i32) (result i32)
    (i32.mul (local.get $n)
             (i32.sub (i32.mul (local.get $n) (i32.const 2)) (i32.const 1)))))
