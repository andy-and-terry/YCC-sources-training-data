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
  (func $f (param $v i64) (param $n i64) (result i64)
    (i64.rem_u (i64.add (i64.mul (local.get $v) (local.get $v)) (i64.const 1)) (local.get $n)))
  (func (export "rho") (param $n i64) (result i64)
    (local $x i64) (local $y i64) (local $d i64)
    (local.set $x (i64.const 2)) (local.set $y (i64.const 2)) (local.set $d (i64.const 1))
    (loop $l
      (local.set $x (call $f (local.get $x) (local.get $n)))
      (local.set $y (call $f (call $f (local.get $y) (local.get $n)) (local.get $n)))
      (local.set $d (call $gcd
        (select (i64.sub (local.get $x) (local.get $y)) (i64.sub (local.get $y) (local.get $x))
                (i64.gt_u (local.get $x) (local.get $y)))
        (local.get $n)))
      (br_if $l (i64.eq (local.get $d) (i64.const 1))))
    (local.get $d)))
