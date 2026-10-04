(module
  (memory (export "memory") 1)

  (func $average (export "average") (param $ptr i32) (param $len i32) (result f64)
    (local $i i32)
    (local $sum i64)
    (if (i32.eqz (local.get $len))
      (then (return (f64.const 0))))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $len)))
        (local.set $sum
          (i64.add
            (local.get $sum)
            (i64.extend_i32_s
              (i32.load
                (i32.add (local.get $ptr) (i32.shl (local.get $i) (i32.const 2)))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (f64.div
      (f64.convert_i64_s (local.get $sum))
      (f64.convert_i32_u (local.get $len))))
)
