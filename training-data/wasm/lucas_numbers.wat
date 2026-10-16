(module
  ;; Lucas sequence: L0 = 2, L1 = 1, L(n) = L(n-1) + L(n-2)
  (func $lucas (export "lucas") (param $n i32) (result i32)
    (local $a i32) (local $b i32) (local $t i32)
    (local.set $a (i32.const 2))
    (local.set $b (i32.const 1))
    (if (i32.eqz (local.get $n)) (then (return (local.get $a))))
    (block $done
      (loop $l
        (br_if $done (i32.le_s (local.get $n) (i32.const 1)))
        (local.set $t (i32.add (local.get $a) (local.get $b)))
        (local.set $a (local.get $b))
        (local.set $b (local.get $t))
        (local.set $n (i32.sub (local.get $n) (i32.const 1)))
        (br $l)))
    (local.get $b)))
