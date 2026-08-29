(module
  (memory (export "memory") 1)

  (func $binary_search (export "binary_search") (param $base i32) (param $low i32) (param $high i32) (param $target i32) (result i32)
    (local $mid i32)
    (local $val i32)
    (if (result i32) (i32.gt_s (local.get $low) (local.get $high))
      (then (i32.const -1))
      (else
        (local.set $mid (i32.div_s (i32.add (local.get $low) (local.get $high)) (i32.const 2)))
        (local.set $val (i32.load (i32.add (local.get $base) (i32.mul (local.get $mid) (i32.const 4)))))
        (if (result i32) (i32.eq (local.get $val) (local.get $target))
          (then (local.get $mid))
          (else
            (if (result i32) (i32.lt_s (local.get $val) (local.get $target))
              (then (call $binary_search (local.get $base) (i32.add (local.get $mid) (i32.const 1)) (local.get $high) (local.get $target)))
              (else (call $binary_search (local.get $base) (local.get $low) (i32.sub (local.get $mid) (i32.const 1)) (local.get $target)))))))))
)
