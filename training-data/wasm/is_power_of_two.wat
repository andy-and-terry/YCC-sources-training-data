(module
  (func $is_pow2 (export "is_pow2") (param $n i32) (result i32)
    (i32.and
      (i32.ne (local.get $n) (i32.const 0))
      (i32.eqz (i32.and (local.get $n)
                        (i32.sub (local.get $n) (i32.const 1)))))))
