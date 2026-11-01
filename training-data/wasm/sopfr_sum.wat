(module
  ;; Sum of prime factors of n counted with multiplicity.
  ;; sopfr(8) = 6 and sopfr(9) = 6, so (8, 9) is a Ruth-Aaron pair.
  (func (export "sopfr") (param $n i32) (result i32)
    (local $p i32)
    (local $total i32)
    (local.set $p (i32.const 2))
    (block $done
      (loop $outer
        (br_if $done (i32.gt_u (i32.mul (local.get $p) (local.get $p)) (local.get $n)))
        (block $next
          (loop $inner
            (br_if $next (i32.rem_u (local.get $n) (local.get $p)))
            (local.set $total (i32.add (local.get $total) (local.get $p)))
            (local.set $n (i32.div_u (local.get $n) (local.get $p)))
            (br $inner)))
        (local.set $p (i32.add (local.get $p) (i32.const 1)))
        (br $outer)))
    (if (i32.gt_u (local.get $n) (i32.const 1))
      (then (local.set $total (i32.add (local.get $total) (local.get $n)))))
    (local.get $total))

  (func (export "is_ruth_aaron") (param $n i32) (result i32)
    (i32.eq (call 0 (local.get $n)) (call 0 (i32.add (local.get $n) (i32.const 1))))))
