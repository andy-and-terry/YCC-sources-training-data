(module
  ;; Moebius function: 0 if n has a squared prime factor, else (-1)^k.
  (func (export "mobius") (param $n i32) (result i32)
    (local $p i32) (local $result i32)
    (local.set $p (i32.const 2))
    (local.set $result (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (i32.mul (local.get $p) (local.get $p)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $p)))
          (then
            (local.set $n (i32.div_u (local.get $n) (local.get $p)))
            (if (i32.eqz (i32.rem_u (local.get $n) (local.get $p)))
              (then (return (i32.const 0))))
            (local.set $result (i32.sub (i32.const 0) (local.get $result)))))
        (local.set $p (i32.add (local.get $p) (i32.const 1)))
        (br $next)))
    (if (result i32) (i32.gt_u (local.get $n) (i32.const 1))
      (then (i32.sub (i32.const 0) (local.get $result)))
      (else (local.get $result)))))
