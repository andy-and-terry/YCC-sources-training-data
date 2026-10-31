(module
  (func (export "cube_from_odds") (param $n i32) (result i32)
    (local $start i32) (local $i i32) (local $sum i32)
    (local.set $start
      (i32.add (i32.sub (i32.mul (local.get $n) (local.get $n)) (local.get $n)) (i32.const 1)))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $sum
          (i32.add (local.get $sum)
            (i32.add (local.get $start) (i32.shl (local.get $i) (i32.const 1)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $sum))
)
