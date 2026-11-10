;; cake(n) = (n^3 + 5n + 6) / 6  -> 1 2 4 8 15 26 42 64 93 130 for n = 0..9
(module
  (func (export "cake") (param $n i32) (result i32)
    (i32.div_u
      (i32.add
        (i32.add
          (i32.mul (i32.mul (local.get $n) (local.get $n)) (local.get $n))
          (i32.mul (i32.const 5) (local.get $n)))
        (i32.const 6))
      (i32.const 6))))
