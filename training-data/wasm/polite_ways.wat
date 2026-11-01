(module
  ;; Number of ways to write n as a sum of two or more consecutive positive
  ;; integers. polite_ways(15) = 3.
  (func (export "polite_ways") (param $n i32) (result i32)
    (local $k i32)
    (local $ways i32)
    (local.set $k (i32.const 2))
    (block $done
      (loop $again
        (br_if $done
          (i32.gt_u
            (i32.shr_u (i32.mul (local.get $k) (i32.add (local.get $k) (i32.const 1))) (i32.const 1))
            (local.get $n)))
        (if (i32.eqz
              (i32.rem_u
                (i32.sub (local.get $n)
                         (i32.shr_u (i32.mul (local.get $k) (i32.sub (local.get $k) (i32.const 1)))
                                    (i32.const 1)))
                (local.get $k)))
          (then (local.set $ways (i32.add (local.get $ways) (i32.const 1)))))
        (local.set $k (i32.add (local.get $k) (i32.const 1)))
        (br $again)))
    (local.get $ways)))
