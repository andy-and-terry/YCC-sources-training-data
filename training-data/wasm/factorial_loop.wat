(module
  (func $fact (export "factorial") (param $n i32) (result i64)
    (local $acc i64)
    (local.set $acc (i64.const 1))
    (block $done
      (loop $again
        (br_if $done (i32.le_u (local.get $n) (i32.const 1)))
        (local.set $acc (i64.mul (local.get $acc) (i64.extend_i32_u (local.get $n))))
        (local.set $n (i32.sub (local.get $n) (i32.const 1)))
        (br $again)))
    (local.get $acc))
)
