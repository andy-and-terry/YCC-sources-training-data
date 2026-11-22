(module
  ;; Emirps: primes whose digit reversal is a different prime.
  ;; is_emirp(13) == 1, is_emirp(11) == 0; count_below(200) == 15
  (func $is_prime (export "is_prime") (param $n i32) (result i32)
    (local $d i32)
    (if (i32.lt_u (local.get $n) (i32.const 2)) (then (return (i32.const 0))))
    (local.set $d (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (i32.mul (local.get $d) (local.get $d)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $d)))
          (then (return (i32.const 0))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $next)))
    (i32.const 1))

  (func $reverse (param $n i32) (result i32)
    (local $r i32)
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $n)))
        (local.set $r
          (i32.add (i32.mul (local.get $r) (i32.const 10))
                   (i32.rem_u (local.get $n) (i32.const 10))))
        (local.set $n (i32.div_u (local.get $n) (i32.const 10)))
        (br $next)))
    (local.get $r))

  (func $is_emirp (export "is_emirp") (param $n i32) (result i32)
    (local $r i32)
    (local.set $r (call $reverse (local.get $n)))
    (i32.and
      (i32.ne (local.get $r) (local.get $n))
      (i32.and (call $is_prime (local.get $n)) (call $is_prime (local.get $r)))))

  (func (export "count_below") (param $limit i32) (result i32)
    (local $n i32) (local $count i32)
    (local.set $n (i32.const 2))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $n) (local.get $limit)))
        (local.set $count (i32.add (local.get $count) (call $is_emirp (local.get $n))))
        (local.set $n (i32.add (local.get $n) (i32.const 1)))
        (br $next)))
    (local.get $count)))
