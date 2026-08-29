(module
  (func $digit_sum (export "digit_sum") (param $n i32) (result i32)
    (local $total i32)
    (local.set $total (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $total (i32.add (local.get $total) (i32.rem_s (local.get $n) (i32.const 10))))
        (local.set $n (i32.div_s (local.get $n) (i32.const 10)))
        (br $loop)))
    (local.get $total))
)
