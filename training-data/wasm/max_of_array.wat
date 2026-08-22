(module
  (func $max_of_array (export "max_of_array") (param $base i32) (param $len i32) (result i32)
    (local $i i32)
    (local $max i32)
    (local $value i32)
    (local.set $max (i32.load (local.get $base)))
    (local.set $i (i32.const 1))
    (block $done
      (loop $iterate
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $value (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (if (i32.gt_s (local.get $value) (local.get $max))
          (then (local.set $max (local.get $value))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $iterate)))
    (local.get $max))
)
