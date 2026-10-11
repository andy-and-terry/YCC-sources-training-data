(module
  ;; Digital root via congruence: 1 + (n - 1) mod 9, with 0 -> 0.
  (func $digital_root (export "digital_root") (param $n i32) (result i32)
    (if (result i32) (i32.eqz (local.get $n))
      (then (i32.const 0))
      (else
        (i32.add (i32.const 1)
          (i32.rem_u (i32.sub (local.get $n) (i32.const 1)) (i32.const 9)))))))
