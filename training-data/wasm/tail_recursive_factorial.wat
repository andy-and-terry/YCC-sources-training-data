(module
  (func $factorial_iter (export "factorial_iter") (param $n i32) (result i32)
    (local $result i32)
    (local $i i32)
    (local.set $result (i32.const 1))
    (local.set $i (i32.const 1))
    (block $done
      (loop $loop
        (br_if $done (i32.gt_s (local.get $i) (local.get $n)))
        (local.set $result (i32.mul (local.get $result) (local.get $i)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $result))
)
