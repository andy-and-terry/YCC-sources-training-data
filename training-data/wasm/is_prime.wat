(module
  (func $is_prime (export "is_prime") (param $n i32) (result i32)
    (local $i i32)
    (local $result i32)
    (if (i32.lt_s (local.get $n) (i32.const 2))
      (then (return (i32.const 0))))
    (local.set $i (i32.const 2))
    (local.set $result (i32.const 1))
    (block $done
      (loop $check
        (br_if $done (i32.gt_s (i32.mul (local.get $i) (local.get $i)) (local.get $n)))
        (if (i32.eqz (i32.rem_s (local.get $n) (local.get $i)))
          (then
            (local.set $result (i32.const 0))
            (br $done)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $check)))
    (local.get $result))
)
