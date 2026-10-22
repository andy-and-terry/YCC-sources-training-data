(module
  ;; n-th s-gonal number: ((s - 2) * n^2 - (s - 4) * n) / 2
  (func $polygonal (export "polygonal") (param $s i32) (param $n i32) (result i32)
    (i32.div_s
      (i32.sub
        (i32.mul (i32.mul (i32.sub (local.get $s) (i32.const 2)) (local.get $n))
                 (local.get $n))
        (i32.mul (i32.sub (local.get $s) (i32.const 4)) (local.get $n)))
      (i32.const 2)))

  (func (export "triangular") (param $n i32) (result i32)
    (call $polygonal (i32.const 3) (local.get $n)))

  (func (export "pentagonal") (param $n i32) (result i32)
    (call $polygonal (i32.const 5) (local.get $n)))

  (func (export "hexagonal") (param $n i32) (result i32)
    (call $polygonal (i32.const 6) (local.get $n)))
)
