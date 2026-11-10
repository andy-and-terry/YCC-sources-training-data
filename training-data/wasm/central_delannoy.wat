;; central_delannoy(n) via the recurrence D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1).
;; central_delannoy(0..5) = 1 3 13 63 321 1683
(module
  (func $d (param $m i32) (param $n i32) (result i32)
    (if (result i32) (i32.or (i32.eqz (local.get $m)) (i32.eqz (local.get $n)))
      (then (i32.const 1))
      (else
        (i32.add
          (i32.add
            (call $d (i32.sub (local.get $m) (i32.const 1)) (local.get $n))
            (call $d (local.get $m) (i32.sub (local.get $n) (i32.const 1))))
          (call $d (i32.sub (local.get $m) (i32.const 1)) (i32.sub (local.get $n) (i32.const 1)))))))

  (func (export "central_delannoy") (param $n i32) (result i32)
    (call $d (local.get $n) (local.get $n))))
