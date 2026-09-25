(module
  (memory (export "memory") 1)

  (func $matrix_transpose (export "matrix_transpose") (param $base i32) (param $n i32)
    (local $i i32)
    (local $j i32)
    (local $addr1 i32)
    (local $addr2 i32)
    (local $temp i32)
    (local.set $i (i32.const 0))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (local.get $n)))
        (local.set $j (i32.add (local.get $i) (i32.const 1)))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_s (local.get $j) (local.get $n)))
            (local.set $addr1
              (i32.add (local.get $base)
                (i32.mul (i32.add (i32.mul (local.get $i) (local.get $n)) (local.get $j)) (i32.const 4))))
            (local.set $addr2
              (i32.add (local.get $base)
                (i32.mul (i32.add (i32.mul (local.get $j) (local.get $n)) (local.get $i)) (i32.const 4))))
            (local.set $temp (i32.load (local.get $addr1)))
            (i32.store (local.get $addr1) (i32.load (local.get $addr2)))
            (i32.store (local.get $addr2) (local.get $temp))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))
)
