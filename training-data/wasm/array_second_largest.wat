(module
  (memory (export "memory") 1)

  (func $second_largest (export "second_largest") (param $base i32) (param $len i32) (result i32)
    (local $i i32)
    (local $v i32)
    (local $largest i32)
    (local $second i32)
    (local.set $largest (i32.load (local.get $base)))
    (local.set $second (i32.const -2147483648))
    (local.set $i (i32.const 1))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $v (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (if (i32.gt_s (local.get $v) (local.get $largest))
          (then
            (local.set $second (local.get $largest))
            (local.set $largest (local.get $v)))
          (else
            (if (i32.and (i32.gt_s (local.get $v) (local.get $second)) (i32.ne (local.get $v) (local.get $largest)))
              (then (local.set $second (local.get $v))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $second))
)
