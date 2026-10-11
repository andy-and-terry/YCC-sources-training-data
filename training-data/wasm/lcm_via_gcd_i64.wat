(module
  (func $gcd (param $a i64) (param $b i64) (result i64)
    (local $t i64)
    (block $done
      (loop $l
        (br_if $done (i64.eqz (local.get $b)))
        (local.set $t (i64.rem_u (local.get $a) (local.get $b)))
        (local.set $a (local.get $b))
        (local.set $b (local.get $t))
        (br $l)))
    (local.get $a))

  (func $lcm (export "lcm") (param $a i64) (param $b i64) (result i64)
    (i64.mul (i64.div_u (local.get $a) (call $gcd (local.get $a) (local.get $b))) (local.get $b))))
