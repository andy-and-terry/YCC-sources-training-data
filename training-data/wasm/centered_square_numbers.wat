(module
  ;; Centered square numbers: n^2 + (n+1)^2.  centered_square(9) == 181
  (func (export "centered_square") (param $n i32) (result i32)
    (i32.add
      (i32.mul (local.get $n) (local.get $n))
      (i32.mul (i32.add (local.get $n) (i32.const 1))
               (i32.add (local.get $n) (i32.const 1))))))
