;; lazy_caterer(n) = (n*n + n + 2) / 2  -> 1 2 4 7 11 16 22 29 37 46 for n = 0..9
(module
  (func (export "lazy_caterer") (param $n i32) (result i32)
    (i32.shr_u
      (i32.add (i32.add (i32.mul (local.get $n) (local.get $n)) (local.get $n)) (i32.const 2))
      (i32.const 1))))
