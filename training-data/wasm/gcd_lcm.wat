(module
  (func $gcd (export "gcd") (param $a i32) (param $b i32) (result i32)
    (local $t i32)
    (block $done
      (loop $loop
        (br_if $done (i32.eqz (local.get $b)))
        (local.set $t (local.get $b))
        (local.set $b (i32.rem_s (local.get $a) (local.get $b)))
        (local.set $a (local.get $t))
        (br $loop)))
    (local.get $a))

  (func $lcm (export "lcm") (param $a i32) (param $b i32) (result i32)
    (i32.div_s (i32.mul (local.get $a) (local.get $b)) (call $gcd (local.get $a) (local.get $b))))
)
