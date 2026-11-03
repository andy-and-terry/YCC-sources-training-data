(module
  ;; Flips the case of one ASCII letter; other bytes pass through.
  (func $swap_case (export "swap_case") (param $c i32) (result i32)
    (if (result i32)
      (i32.lt_u (i32.sub (local.get $c) (i32.const 65)) (i32.const 26))
      (then (i32.add (local.get $c) (i32.const 32)))
      (else
        (if (result i32)
          (i32.lt_u (i32.sub (local.get $c) (i32.const 97)) (i32.const 26))
          (then (i32.sub (local.get $c) (i32.const 32)))
          (else (local.get $c)))))))
