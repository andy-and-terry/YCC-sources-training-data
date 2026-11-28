(module
  (func (export "is_automorphic") (param $n i32) (result i32)
    (local $modulus i64) (local $m i32)
    (local.set $modulus (i64.const 10))
    (local.set $m (local.get $n))
    (block $done
      (loop $grow
        (br_if $done (i32.lt_u (local.get $m) (i32.const 10)))
        (local.set $modulus (i64.mul (local.get $modulus) (i64.const 10)))
        (local.set $m (i32.div_u (local.get $m) (i32.const 10)))
        (br $grow)))
    (i64.eq
      (i64.rem_u
        (i64.mul (i64.extend_i32_u (local.get $n)) (i64.extend_i32_u (local.get $n)))
        (local.get $modulus))
      (i64.extend_i32_u (local.get $n)))))
