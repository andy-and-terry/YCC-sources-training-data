(module
  (func $ctz (export "ctz") (param $n i32) (result i32)
    (i32.ctz (local.get $n)))

  (func $clz (export "clz") (param $n i32) (result i32)
    (i32.clz (local.get $n)))

  ;; Index of the highest set bit, or -1 for zero.
  (func $log2_floor (export "log2_floor") (param $n i32) (result i32)
    (if (result i32) (i32.eqz (local.get $n))
      (then (i32.const -1))
      (else (i32.sub (i32.const 31) (i32.clz (local.get $n))))))
)
