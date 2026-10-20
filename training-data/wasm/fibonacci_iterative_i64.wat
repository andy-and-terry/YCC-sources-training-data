(module
  (func (export "fib") (param $n i32) (result i64)
    (local $a i64) (local $b i64) (local $t i64)
    (local.set $b (i64.const 1))
    (block $done
      (loop $step
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $t (i64.add (local.get $a) (local.get $b)))
        (local.set $a (local.get $b))
        (local.set $b (local.get $t))
        (local.set $n (i32.sub (local.get $n) (i32.const 1)))
        (br $step)))
    (local.get $a)))
