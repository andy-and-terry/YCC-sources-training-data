(module
  (func $is_perfect (export "is_perfect") (param $n i32) (result i32)
    (local $i i32) (local $sum i32)
    (if (i32.lt_u (local.get $n) (i32.const 2))
      (then (return (i32.const 0))))
    (local.set $sum (i32.const 1))
    (local.set $i (i32.const 2))
    (block $done
      (loop $l
        (br_if $done (i32.gt_u (i32.mul (local.get $i) (local.get $i)) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $i)))
          (then
            (local.set $sum (i32.add (local.get $sum) (local.get $i)))
            (if (i32.ne (local.get $i) (i32.div_u (local.get $n) (local.get $i)))
              (then
                (local.set $sum
                  (i32.add (local.get $sum) (i32.div_u (local.get $n) (local.get $i))))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $l)))
    (i32.eq (local.get $sum) (local.get $n))))
