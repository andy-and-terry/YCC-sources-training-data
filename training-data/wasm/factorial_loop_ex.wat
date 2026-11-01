(module
  (func $fact (export "fact") (param $n i32) (result i32)
    (local $acc i32)
    (local.set $acc (i32.const 1))
    (block $done
      (loop $again
        (br_if $done (i32.le_s (local.get $n) (i32.const 1)))
        (local.set $acc (i32.mul (local.get $acc) (local.get $n)))
        (local.set $n (i32.sub (local.get $n) (i32.const 1)))
        (br $again)))
    (local.get $acc)))
