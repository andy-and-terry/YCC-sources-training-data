(module
  (func (export "prime_factor_count") (param $n i32) (result i32)
    (local $p i32) (local $count i32)
    (local.set $p (i32.const 2))
    (block $done
      (loop $outer
        (br_if $done (i32.gt_u (i32.mul (local.get $p) (local.get $p)) (local.get $n)))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.rem_u (local.get $n) (local.get $p)))
            (local.set $n (i32.div_u (local.get $n) (local.get $p)))
            (local.set $count (i32.add (local.get $count) (i32.const 1)))
            (br $inner)))
        (local.set $p (i32.add (local.get $p) (i32.const 1)))
        (br $outer)))
    (i32.add (local.get $count) (i32.gt_u (local.get $n) (i32.const 1))))
  (func (export "is_semiprime") (param $n i32) (result i32)
    (i32.eq (call 0 (local.get $n)) (i32.const 2)))
)
