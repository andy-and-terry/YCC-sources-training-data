(module
  ;; Carmichael numbers via Korselt's criterion: n is squarefree, composite,
  ;; and p - 1 divides n - 1 for every prime factor p.
  ;; is_carmichael(561) == 1
  (func (export "is_carmichael") (param $n i32) (result i32)
    (local $m i32) (local $p i32) (local $count i32)
    (local.set $m (local.get $n))
    (local.set $p (i32.const 2))
    (block $scan_done
      (loop $scan
        (br_if $scan_done
          (i32.gt_u (i32.mul (local.get $p) (local.get $p)) (local.get $m)))
        (if (i32.eqz (i32.rem_u (local.get $m) (local.get $p)))
          (then
            (local.set $m (i32.div_u (local.get $m) (local.get $p)))
            ;; repeated factor -> not squarefree
            (if (i32.eqz (i32.rem_u (local.get $m) (local.get $p)))
              (then (return (i32.const 0))))
            ;; (p - 1) must divide (n - 1)
            (if (i32.rem_u
                  (i32.sub (local.get $n) (i32.const 1))
                  (i32.sub (local.get $p) (i32.const 1)))
              (then (return (i32.const 0))))
            (local.set $count (i32.add (local.get $count) (i32.const 1)))))
        (local.set $p (i32.add (local.get $p) (i32.const 1)))
        (br $scan)))
    ;; leftover prime factor
    (if (i32.gt_u (local.get $m) (i32.const 1))
      (then
        (if (i32.rem_u
              (i32.sub (local.get $n) (i32.const 1))
              (i32.sub (local.get $m) (i32.const 1)))
          (then (return (i32.const 0))))
        (local.set $count (i32.add (local.get $count) (i32.const 1)))))
    (i32.ge_u (local.get $count) (i32.const 2))))
