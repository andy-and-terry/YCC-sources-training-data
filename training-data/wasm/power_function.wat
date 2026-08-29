(module
  (func $power (export "power") (param $base i32) (param $exp i32) (result i32)
    (local $half i32)
    (if (result i32) (i32.eqz (local.get $exp))
      (then (i32.const 1))
      (else
        (if (result i32) (i32.eqz (i32.rem_s (local.get $exp) (i32.const 2)))
          (then
            (local.set $half (call $power (local.get $base) (i32.div_s (local.get $exp) (i32.const 2))))
            (i32.mul (local.get $half) (local.get $half)))
          (else
            (i32.mul (local.get $base) (call $power (local.get $base) (i32.sub (local.get $exp) (i32.const 1)))))))))
)
