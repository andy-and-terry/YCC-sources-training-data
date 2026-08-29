(module
  (memory (export "memory") 1)

  (func $binary_to_decimal (export "binary_to_decimal") (param $base i32) (param $len i32) (result i32)
    (local $i i32)
    (local $result i32)
    (local $bit i32)
    (local.set $result (i32.const 0))
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $bit (i32.sub (i32.load8_u (i32.add (local.get $base) (local.get $i))) (i32.const 48)))
        (local.set $result (i32.add (i32.mul (local.get $result) (i32.const 2)) (local.get $bit)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $result))
)
