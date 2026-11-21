(module
  ;; Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
  ;; is_perfect_totient(27) == 1  (18 + 6 + 2 + 1 = 27)
  (func $gcd (param $a i32) (param $b i32) (result i32)
    (local $t i32)
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $b)))
        (local.set $t (i32.rem_u (local.get $a) (local.get $b)))
        (local.set $a (local.get $b))
        (local.set $b (local.get $t))
        (br $next)))
    (local.get $a))

  (func $phi (param $n i32) (result i32)
    (local $k i32) (local $c i32)
    (local.set $k (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (local.get $k) (local.get $n)))
        (if (i32.eq (call $gcd (local.get $k) (local.get $n)) (i32.const 1))
          (then (local.set $c (i32.add (local.get $c) (i32.const 1)))))
        (local.set $k (i32.add (local.get $k) (i32.const 1)))
        (br $next)))
    (local.get $c))

  (func (export "is_perfect_totient") (param $n i32) (result i32)
    (local $m i32) (local $total i32)
    (local.set $m (local.get $n))
    (block $done
      (loop $next
        (br_if $done (i32.le_u (local.get $m) (i32.const 1)))
        (local.set $m (call $phi (local.get $m)))
        (local.set $total (i32.add (local.get $total) (local.get $m)))
        (br $next)))
    (i32.eq (local.get $total) (local.get $n))))
