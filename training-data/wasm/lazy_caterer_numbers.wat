(module
  ;; Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
  ;; pieces(0..9) == 1 2 4 7 11 16 22 29 37 46
  (func (export "pieces") (param $n i32) (result i32)
    (i32.add
      (i32.div_u
        (i32.mul (local.get $n) (i32.add (local.get $n) (i32.const 1)))
        (i32.const 2))
      (i32.const 1))))
