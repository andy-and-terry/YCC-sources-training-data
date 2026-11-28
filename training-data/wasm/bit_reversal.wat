(module
  (func (export "reverse8") (param $v i32) (result i32)
    (local $r i32) (local $i i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (i32.const 8)))
        (local.set $r
          (i32.or (i32.shl (local.get $r) (i32.const 1))
                  (i32.and (local.get $v) (i32.const 1))))
        (local.set $v (i32.shr_u (local.get $v) (i32.const 1)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $r)))
