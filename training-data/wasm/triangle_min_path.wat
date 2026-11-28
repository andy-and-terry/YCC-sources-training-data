(module
  (memory (export "mem") 1)

  ;; Triangle rows are stored back to back as i32s; `rows` is the row count.
  ;; Row r (0-based) starts at element r*(r+1)/2. Bottom-up DP overwrites the
  ;; row above with the best cost from each position down to the base.
  (func $minimum_total (export "minimum_total") (param $ptr i32) (param $rows i32) (result i32)
    (local $r i32) (local $i i32) (local $below i32) (local $cur i32) (local $l i32) (local $rr i32)
    (local.set $r (i32.sub (local.get $rows) (i32.const 2)))
    (block $done
      (loop $row
        (br_if $done (i32.lt_s (local.get $r) (i32.const 0)))
        (local.set $below
          (i32.add (local.get $ptr)
            (i32.shl (i32.shr_u (i32.mul (i32.add (local.get $r) (i32.const 1))
                                         (i32.add (local.get $r) (i32.const 2))) (i32.const 1))
                     (i32.const 2))))
        (local.set $cur
          (i32.add (local.get $ptr)
            (i32.shl (i32.shr_u (i32.mul (local.get $r) (i32.add (local.get $r) (i32.const 1))) (i32.const 1))
                     (i32.const 2))))
        (local.set $i (i32.const 0))
        (loop $col
          (local.set $l (i32.load (i32.add (local.get $below) (i32.shl (local.get $i) (i32.const 2)))))
          (local.set $rr (i32.load (i32.add (local.get $below) (i32.shl (i32.add (local.get $i) (i32.const 1)) (i32.const 2)))))
          (i32.store (i32.add (local.get $cur) (i32.shl (local.get $i) (i32.const 2)))
            (i32.add
              (i32.load (i32.add (local.get $cur) (i32.shl (local.get $i) (i32.const 2))))
              (select (local.get $l) (local.get $rr) (i32.lt_s (local.get $l) (local.get $rr)))))
          (local.set $i (i32.add (local.get $i) (i32.const 1)))
          (br_if $col (i32.le_s (local.get $i) (local.get $r))))
        (local.set $r (i32.sub (local.get $r) (i32.const 1)))
        (br $row)))
    (i32.load (local.get $ptr)))
)
