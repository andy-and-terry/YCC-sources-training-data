(module
  ;; Floor of the square root using binary search over [0, 46340].
  (func $isqrt (export "isqrt") (param $n i32) (result i32)
    (local $lo i32)
    (local $hi i32)
    (local $mid i32)
    (local $ans i32)
    (local.set $hi (i32.const 46340))
    (block $done
      (loop $search
        (br_if $done (i32.gt_s (local.get $lo) (local.get $hi)))
        (local.set $mid (i32.shr_u (i32.add (local.get $lo) (local.get $hi)) (i32.const 1)))
        (if (i32.le_s (i32.mul (local.get $mid) (local.get $mid)) (local.get $n))
          (then
            (local.set $ans (local.get $mid))
            (local.set $lo (i32.add (local.get $mid) (i32.const 1))))
          (else
            (local.set $hi (i32.sub (local.get $mid) (i32.const 1)))))
        (br $search)))
    (local.get $ans))
)
