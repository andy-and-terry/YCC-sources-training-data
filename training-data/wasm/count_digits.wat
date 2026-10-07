(module
  (func $count_digits (export "count_digits") (param $n i32) (result i32)
    (local $count i32)
    (if (i32.eqz (local.get $n))
      (then (return (i32.const 1))))
    (block $done
      (loop $again
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $n (i32.div_u (local.get $n) (i32.const 10)))
        (local.set $count (i32.add (local.get $count) (i32.const 1)))
        (br $again)))
    (local.get $count))
)
