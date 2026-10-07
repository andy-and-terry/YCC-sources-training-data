(module
  (memory (export "memory") 1)

  ;; writes i*i as i32 at offset i*4 for i in [0, n)
  (func $fill_squares (export "fill_squares") (param $n i32)
    (local $i i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (i32.store
          (i32.shl (local.get $i) (i32.const 2))
          (i32.mul (local.get $i) (local.get $i)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next))))

  (func $get (export "get") (param $i i32) (result i32)
    (i32.load (i32.shl (local.get $i) (i32.const 2))))

  (func $sum_filled (export "sum_filled") (param $n i32) (result i32)
    (local $i i32)
    (local $sum i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $sum (i32.add (local.get $sum) (call $get (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $sum))
)
