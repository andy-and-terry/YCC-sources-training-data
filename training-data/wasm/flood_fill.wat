(module
  (memory (export "memory") 1)

  ;; Recursive flood fill over a byte grid (rows x cols) at grid_base:
  ;; replaces every connected cell equal to old_value, starting at
  ;; (row, col), with new_value, and returns how many cells changed.

  (func $flood_fill (export "flood_fill")
        (param $grid_base i32) (param $rows i32) (param $cols i32)
        (param $row i32) (param $col i32) (param $old_value i32) (param $new_value i32)
        (result i32)
    (local $addr i32)
    (local $count i32)
    (if (result i32)
      (i32.or
        (i32.or (i32.lt_s (local.get $row) (i32.const 0)) (i32.ge_s (local.get $row) (local.get $rows)))
        (i32.or (i32.lt_s (local.get $col) (i32.const 0)) (i32.ge_s (local.get $col) (local.get $cols))))
      (then (i32.const 0))
      (else
        (local.set $addr (i32.add (local.get $grid_base) (i32.add (i32.mul (local.get $row) (local.get $cols)) (local.get $col))))
        (if (result i32) (i32.ne (i32.load8_u (local.get $addr)) (local.get $old_value))
          (then (i32.const 0))
          (else
            (i32.store8 (local.get $addr) (local.get $new_value))
            (local.set $count (i32.const 1))
            (local.set $count (i32.add (local.get $count)
              (call $flood_fill (local.get $grid_base) (local.get $rows) (local.get $cols)
                (i32.add (local.get $row) (i32.const 1)) (local.get $col) (local.get $old_value) (local.get $new_value))))
            (local.set $count (i32.add (local.get $count)
              (call $flood_fill (local.get $grid_base) (local.get $rows) (local.get $cols)
                (i32.sub (local.get $row) (i32.const 1)) (local.get $col) (local.get $old_value) (local.get $new_value))))
            (local.set $count (i32.add (local.get $count)
              (call $flood_fill (local.get $grid_base) (local.get $rows) (local.get $cols)
                (local.get $row) (i32.add (local.get $col) (i32.const 1)) (local.get $old_value) (local.get $new_value))))
            (local.set $count (i32.add (local.get $count)
              (call $flood_fill (local.get $grid_base) (local.get $rows) (local.get $cols)
                (local.get $row) (i32.sub (local.get $col) (i32.const 1)) (local.get $old_value) (local.get $new_value))))
            (local.get $count))))))
)
