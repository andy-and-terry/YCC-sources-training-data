(module
  ;; floor(sqrt(n)) by binary search
  (func $isqrt (export "isqrt") (param $n i32) (result i32)
    (local $lo i32)
    (local $hi i32)
    (local $mid i32)
    (local.set $lo (i32.const 0))
    (local.set $hi (select (local.get $n) (i32.const 65535) (i32.lt_u (local.get $n) (i32.const 65535))))
    (block $done
      (loop $search
        (br_if $done (i32.ge_u (local.get $lo) (local.get $hi)))
        (local.set $mid
          (i32.shr_u (i32.add (i32.add (local.get $lo) (local.get $hi)) (i32.const 1)) (i32.const 1)))
        (if (i32.le_u (i32.mul (local.get $mid) (local.get $mid)) (local.get $n))
          (then (local.set $lo (local.get $mid)))
          (else (local.set $hi (i32.sub (local.get $mid) (i32.const 1)))))
        (br $search)))
    (local.get $lo))
)
