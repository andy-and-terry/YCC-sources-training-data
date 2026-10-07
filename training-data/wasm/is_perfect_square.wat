(module
  (func $is_perfect_square (export "is_perfect_square") (param $n i32) (result i32)
    (local $root i32)
    (if (i32.lt_s (local.get $n) (i32.const 0))
      (then (return (i32.const 0))))
    (local.set $root
      (i32.trunc_f64_s (f64.sqrt (f64.convert_i32_s (local.get $n)))))
    (i32.eq (i32.mul (local.get $root) (local.get $root)) (local.get $n)))

  (func $isqrt_search (export "isqrt_search") (param $n i32) (result i32)
    (local $lo i32)
    (local $hi i32)
    (local $mid i32)
    (local.set $hi (i32.const 46340))
    (block $done
      (loop $search
        (br_if $done (i32.ge_s (local.get $lo) (local.get $hi)))
        (local.set $mid
          (i32.shr_u (i32.add (i32.add (local.get $lo) (local.get $hi)) (i32.const 1)) (i32.const 1)))
        (if (i32.le_s (i32.mul (local.get $mid) (local.get $mid)) (local.get $n))
          (then (local.set $lo (local.get $mid)))
          (else (local.set $hi (i32.sub (local.get $mid) (i32.const 1)))))
        (br $search)))
    (local.get $lo))
)
