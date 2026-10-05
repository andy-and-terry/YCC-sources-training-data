(module
  ;; Kernighan's bit counting: n &= n - 1 clears the lowest set bit.
  (func $popcount (export "popcount") (param $n i32) (result i32)
    (local $count i32)
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $n (i32.and (local.get $n) (i32.sub (local.get $n) (i32.const 1))))
        (local.set $count (i32.add (local.get $count) (i32.const 1)))
        (br $next)))
    (local.get $count))
)
