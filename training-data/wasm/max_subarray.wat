(module
  (memory (export "memory") 1)

  (func $kadane (export "kadane") (param $base i32) (param $len i32) (result i32)
    (local $i i32)
    (local $best i32)
    (local $current i32)
    (local $x i32)
    (local $sum i32)
    (local.set $best (i32.load (local.get $base)))
    (local.set $current (local.get $best))
    (local.set $i (i32.const 1))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $x (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $sum (i32.add (local.get $current) (local.get $x)))
        (local.set $current (select (local.get $x) (local.get $sum) (i32.gt_s (local.get $x) (local.get $sum))))
        (local.set $best (select (local.get $best) (local.get $current) (i32.gt_s (local.get $best) (local.get $current))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $best))
)
