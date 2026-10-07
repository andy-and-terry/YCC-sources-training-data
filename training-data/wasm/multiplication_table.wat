(module
  (memory (export "memory") 1)

  ;; Fill n*n i32 cells with (row+1)*(col+1); returns the cell count
  (func (export "fill_table") (param $n i32) (result i32)
    (local $r i32)
    (local $c i32)
    (local $ptr i32)
    (block $done_r
      (loop $row
        (br_if $done_r (i32.ge_u (local.get $r) (local.get $n)))
        (local.set $c (i32.const 0))
        (block $done_c
          (loop $col
            (br_if $done_c (i32.ge_u (local.get $c) (local.get $n)))
            (i32.store (local.get $ptr)
              (i32.mul
                (i32.add (local.get $r) (i32.const 1))
                (i32.add (local.get $c) (i32.const 1))))
            (local.set $ptr (i32.add (local.get $ptr) (i32.const 4)))
            (local.set $c (i32.add (local.get $c) (i32.const 1)))
            (br $col)))
        (local.set $r (i32.add (local.get $r) (i32.const 1)))
        (br $row)))
    (i32.mul (local.get $n) (local.get $n)))

  (func (export "get") (param $idx i32) (result i32)
    (i32.load (i32.shl (local.get $idx) (i32.const 2))))
)
