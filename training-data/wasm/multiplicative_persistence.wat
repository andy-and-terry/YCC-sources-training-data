(module
  (func (export "persistence") (param $n i64) (result i32)
    (local $steps i32) (local $product i64)
    (block $done
      (loop $outer
        (br_if $done (i64.lt_u (local.get $n) (i64.const 10)))
        (local.set $product (i64.const 1))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i64.eqz (local.get $n)))
            (local.set $product
              (i64.mul (local.get $product) (i64.rem_u (local.get $n) (i64.const 10))))
            (local.set $n (i64.div_u (local.get $n) (i64.const 10)))
            (br $inner)))
        (local.set $n (local.get $product))
        (local.set $steps (i32.add (local.get $steps) (i32.const 1)))
        (br $outer)))
    (local.get $steps))
)
