;; Square of the sum minus sum of squares for 1..10 (expect 2640)
(module
  (func $diff (export "diff") (param $n i32) (result i32)
    (local $i i32) (local $sum i32) (local $squares i32)
    (local.set $i (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (local.get $i) (local.get $n)))
        (local.set $sum (i32.add (local.get $sum) (local.get $i)))
        (local.set $squares (i32.add (local.get $squares) (i32.mul (local.get $i) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (i32.sub (i32.mul (local.get $sum) (local.get $sum)) (local.get $squares)))
)
