(module
  ;; A block that yields a value via br with an operand.
  (func $classify (export "classify") (param $x i32) (result i32)
    (block $out (result i32)
      (if (i32.lt_s (local.get $x) (i32.const 0))
        (then (br $out (i32.const -1))))
      (if (i32.eqz (local.get $x))
        (then (br $out (i32.const 0))))
      (i32.const 1))))
