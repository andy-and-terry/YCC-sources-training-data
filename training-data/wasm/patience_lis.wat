(module
  (memory 1)
  (data (i32.const 0) "\0a\00\00\00\09\00\00\00\02\00\00\00\05\00\00\00\03\00\00\00\07\00\00\00\65\00\00\00\12\00\00\00")
  ;; tails stored at offset 64
  (func (export "lis") (result i32)
    (local $i i32) (local $len i32) (local $lo i32) (local $hi i32) (local $mid i32) (local $x i32)
    (loop $outer
      (local.set $x (i32.load (i32.mul (local.get $i) (i32.const 4))))
      (local.set $lo (i32.const 0))
      (local.set $hi (local.get $len))
      (block $bs_done
        (loop $bs
          (br_if $bs_done (i32.ge_u (local.get $lo) (local.get $hi)))
          (local.set $mid (i32.shr_u (i32.add (local.get $lo) (local.get $hi)) (i32.const 1)))
          (if (i32.lt_s (i32.load (i32.add (i32.const 64) (i32.mul (local.get $mid) (i32.const 4)))) (local.get $x))
            (then (local.set $lo (i32.add (local.get $mid) (i32.const 1))))
            (else (local.set $hi (local.get $mid))))
          (br $bs)))
      (i32.store (i32.add (i32.const 64) (i32.mul (local.get $lo) (i32.const 4))) (local.get $x))
      (if (i32.eq (local.get $lo) (local.get $len))
        (then (local.set $len (i32.add (local.get $len) (i32.const 1)))))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $outer (i32.lt_u (local.get $i) (i32.const 8))))
    (local.get $len)))
