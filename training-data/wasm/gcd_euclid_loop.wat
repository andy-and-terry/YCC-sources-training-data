(module
  (func (export "gcd") (param $a i32) (param $b i32) (result i32)
    (local $t i32)
    (block $exit
      (loop $again
        (br_if $exit (i32.eqz (local.get $b)))
        (local.set $t (i32.rem_u (local.get $a) (local.get $b)))
        (local.set $a (local.get $b))
        (local.set $b (local.get $t))
        (br $again)))
    (local.get $a)))
