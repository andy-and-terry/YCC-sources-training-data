(module
  (memory (export "memory") 1)
  (global $top (mut i32) (i32.const -1))

  ;; A stack that reports its minimum element in O(1): values_base
  ;; holds the pushed values, mins_base holds, at the same index, the
  ;; minimum seen from the bottom of the stack up to that point.

  (func $ms_push (export "ms_push") (param $values_base i32) (param $mins_base i32) (param $value i32)
    (local $prev_min i32)
    (global.set $top (i32.add (global.get $top) (i32.const 1)))
    (i32.store (i32.add (local.get $values_base) (i32.mul (global.get $top) (i32.const 4))) (local.get $value))
    (if (i32.eqz (global.get $top))
      (then (i32.store (local.get $mins_base) (local.get $value)))
      (else
        (local.set $prev_min (i32.load (i32.add (local.get $mins_base) (i32.mul (i32.sub (global.get $top) (i32.const 1)) (i32.const 4)))))
        (i32.store
          (i32.add (local.get $mins_base) (i32.mul (global.get $top) (i32.const 4)))
          (select (local.get $value) (local.get $prev_min) (i32.lt_s (local.get $value) (local.get $prev_min)))))))

  (func $ms_pop (export "ms_pop") (param $values_base i32) (result i32)
    (local $value i32)
    (local.set $value (i32.load (i32.add (local.get $values_base) (i32.mul (global.get $top) (i32.const 4)))))
    (global.set $top (i32.sub (global.get $top) (i32.const 1)))
    (local.get $value))

  (func $ms_get_min (export "ms_get_min") (param $mins_base i32) (result i32)
    (i32.load (i32.add (local.get $mins_base) (i32.mul (global.get $top) (i32.const 4)))))

  (func $ms_is_empty (export "ms_is_empty") (result i32)
    (i32.lt_s (global.get $top) (i32.const 0)))
)
