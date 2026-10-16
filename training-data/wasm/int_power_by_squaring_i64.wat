(module
  (func $ipow (export "ipow") (param $base i64) (param $exp i32) (result i64)
    (local $r i64)
    (local.set $r (i64.const 1))
    (block $done
      (loop $l
        (br_if $done (i32.eqz (local.get $exp)))
        (if (i32.and (local.get $exp) (i32.const 1))
          (then (local.set $r (i64.mul (local.get $r) (local.get $base)))))
        (local.set $base (i64.mul (local.get $base) (local.get $base)))
        (local.set $exp (i32.shr_u (local.get $exp) (i32.const 1)))
        (br $l)))
    (local.get $r)))
