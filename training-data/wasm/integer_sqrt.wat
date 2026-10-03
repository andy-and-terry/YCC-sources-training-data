(module
  ;; Integer square root via binary search: largest r with r*r <= n.

  (func $isqrt (export "isqrt") (param $n i32) (result i32)
    (local $lo i32)
    (local $hi i32)
    (local $mid i32)
    (local $best i32)
    (local.set $lo (i32.const 0))
    (local.set $hi (local.get $n))
    (local.set $best (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.gt_s (local.get $lo) (local.get $hi)))
        (local.set $mid (i32.div_s (i32.add (local.get $lo) (local.get $hi)) (i32.const 2)))
        (if (i32.le_s (i32.mul (local.get $mid) (local.get $mid)) (local.get $n))
          (then
            (local.set $best (local.get $mid))
            (local.set $lo (i32.add (local.get $mid) (i32.const 1))))
          (else
            (local.set $hi (i32.sub (local.get $mid) (i32.const 1)))))
        (br $loop)))
    (local.get $best))
)
