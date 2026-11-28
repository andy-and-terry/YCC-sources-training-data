(module
  (memory 1)
  ;; central Delannoy number D(n,n) with a rolling row stored in memory
  (func (export "central") (param $n i32) (result i32)
    (local $i i32) (local $j i32) (local $up i32) (local $diag i32)
    (local.set $j (i32.const 0))
    (loop $init
      (i32.store (i32.shl (local.get $j) (i32.const 2)) (i32.const 1))
      (local.set $j (i32.add (local.get $j) (i32.const 1)))
      (br_if $init (i32.le_u (local.get $j) (local.get $n))))
    (local.set $i (i32.const 1))
    (block $rows_done
      (loop $rows
        (br_if $rows_done (i32.gt_u (local.get $i) (local.get $n)))
        (local.set $diag (i32.load (i32.const 0)))
        (local.set $j (i32.const 1))
        (loop $cols
          (local.set $up (i32.load (i32.shl (local.get $j) (i32.const 2))))
          (i32.store (i32.shl (local.get $j) (i32.const 2))
            (i32.add (i32.add (local.get $up)
              (i32.load (i32.shl (i32.sub (local.get $j) (i32.const 1)) (i32.const 2))))
              (local.get $diag)))
          (local.set $diag (local.get $up))
          (local.set $j (i32.add (local.get $j) (i32.const 1)))
          (br_if $cols (i32.le_u (local.get $j) (local.get $n))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $rows)))
    (i32.load (i32.shl (local.get $n) (i32.const 2))))
)
