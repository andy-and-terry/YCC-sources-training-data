(module
  ;; L(n,k) = C(n-1,k-1) * n!/k!
  (func (export "lah") (param $n i64) (param $k i64) (result i64)
    (local $c i64) (local $f i64) (local $i i64)
    (local.set $c (i64.const 1))
    (local.set $f (i64.const 1))
    (block $d1
      (loop $l1
        (br_if $d1 (i64.ge_u (i64.add (local.get $i) (i64.const 1)) (local.get $k)))
        (local.set $c (i64.div_u
          (i64.mul (local.get $c) (i64.sub (i64.sub (local.get $n) (i64.const 1)) (local.get $i)))
          (i64.add (local.get $i) (i64.const 1))))
        (local.set $i (i64.add (local.get $i) (i64.const 1)))
        (br $l1)))
    (local.set $i (i64.add (local.get $k) (i64.const 1)))
    (block $d2
      (loop $l2
        (br_if $d2 (i64.gt_u (local.get $i) (local.get $n)))
        (local.set $f (i64.mul (local.get $f) (local.get $i)))
        (local.set $i (i64.add (local.get $i) (i64.const 1)))
        (br $l2)))
    (i64.mul (local.get $c) (local.get $f)))
)
