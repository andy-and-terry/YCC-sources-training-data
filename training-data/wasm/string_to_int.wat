(module
  (memory (export "memory") 1)

  (func $string_to_int (export "string_to_int") (param $base i32) (param $len i32) (result i32)
    (local $i i32)
    (local $result i32)
    (local $sign i32)
    (local $c i32)
    (local.set $result (i32.const 0))
    (local.set $sign (i32.const 1))
    (local.set $i (i32.const 0))
    (if (i32.gt_s (local.get $len) (i32.const 0))
      (then
        (if (i32.eq (i32.load8_u (local.get $base)) (i32.const 45))
          (then
            (local.set $sign (i32.const -1))
            (local.set $i (i32.const 1))))))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $c (i32.load8_u (i32.add (local.get $base) (local.get $i))))
        (local.set $result
          (i32.add (i32.mul (local.get $result) (i32.const 10)) (i32.sub (local.get $c) (i32.const 48))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (i32.mul (local.get $result) (local.get $sign)))
)
