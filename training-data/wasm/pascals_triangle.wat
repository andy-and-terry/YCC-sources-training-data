(module
  (memory (export "memory") 1)

  ;; Writes row n (0-indexed) of Pascal's triangle into row_base,
  ;; building it in place from the right so each entry is updated
  ;; before it is read as the "previous row" value for the next slot.

  (func $pascal_row (export "pascal_row") (param $row_base i32) (param $n i32)
    (local $i i32)
    (local $j i32)
    (local.set $i (i32.const 0))
    (block $clear_done
      (loop $clear
        (br_if $clear_done (i32.gt_s (local.get $i) (local.get $n)))
        (i32.store (i32.add (local.get $row_base) (i32.mul (local.get $i) (i32.const 4))) (i32.const 0))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $clear)))
    (i32.store (local.get $row_base) (i32.const 1))

    (local.set $i (i32.const 1))
    (block $row_done
      (loop $row_loop
        (br_if $row_done (i32.gt_s (local.get $i) (local.get $n)))
        (local.set $j (local.get $i))
        (block $col_done
          (loop $col_loop
            (br_if $col_done (i32.le_s (local.get $j) (i32.const 0)))
            (i32.store
              (i32.add (local.get $row_base) (i32.mul (local.get $j) (i32.const 4)))
              (i32.add
                (i32.load (i32.add (local.get $row_base) (i32.mul (local.get $j) (i32.const 4))))
                (i32.load (i32.add (local.get $row_base) (i32.mul (i32.sub (local.get $j) (i32.const 1)) (i32.const 4))))))
            (local.set $j (i32.sub (local.get $j) (i32.const 1)))
            (br $col_loop)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $row_loop))))
)
