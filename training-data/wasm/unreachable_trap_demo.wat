(module
  (func $safe_div (export "safe_div") (param $a i32) (param $b i32) (result i32)
    (if (i32.eqz (local.get $b))
      (then (unreachable)))
    (i32.div_s (local.get $a) (local.get $b)))
)
