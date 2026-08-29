(module
  (memory (export "memory") 1)

  (func $sum_array (export "sum_array") (param $base i32) (param $len i32) (result i32)
    (local $i i32)
    (local $total i32)
    (local.set $total (i32.const 0))
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $total (i32.add (local.get $total) (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $total))
)
