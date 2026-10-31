(module
  (memory (export "mem") 1)
  ;; digits of the number are stored one byte each starting at offset 0
  (func (export "is_self_describing") (param $len i32) (result i32)
    (local $i i32) (local $j i32) (local $count i32)
    (block $done
      (loop $outer
        (br_if $done (i32.ge_u (local.get $i) (local.get $len)))
        (local.set $count (i32.const 0))
        (local.set $j (i32.const 0))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_u (local.get $j) (local.get $len)))
            (if (i32.eq (i32.load8_u (local.get $j)) (local.get $i))
              (then (local.set $count (i32.add (local.get $count) (i32.const 1)))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $inner)))
        (if (i32.ne (local.get $count) (i32.load8_u (local.get $i)))
          (then (return (i32.const 0))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (i32.const 1))
)
