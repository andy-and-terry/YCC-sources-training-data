(module
  (func $ackermann (export "ackermann") (param $m i32) (param $n i32) (result i32)
    (if (result i32) (i32.eqz (local.get $m))
      (then (i32.add (local.get $n) (i32.const 1)))
      (else
        (if (result i32) (i32.eqz (local.get $n))
          (then (call $ackermann (i32.sub (local.get $m) (i32.const 1)) (i32.const 1)))
          (else
            (call $ackermann
              (i32.sub (local.get $m) (i32.const 1))
              (call $ackermann (local.get $m) (i32.sub (local.get $n) (i32.const 1)))))))))
)
