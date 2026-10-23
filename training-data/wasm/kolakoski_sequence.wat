(module
  (memory (export "memory") 1)

  ;; Writes the first $count (>= 3) terms as i32s at address 0.
  (func (export "kolakoski") (param $count i32)
    (local $len i32) (local $i i32) (local $value i32) (local $run i32)
    (i32.store (i32.const 0) (i32.const 1))
    (i32.store (i32.const 4) (i32.const 2))
    (i32.store (i32.const 8) (i32.const 2))
    (local.set $len (i32.const 3))
    (local.set $i (i32.const 2))
    (block $done
      (loop $outer
        (br_if $done (i32.ge_s (local.get $len) (local.get $count)))
        (local.set $value
          (i32.sub
            (i32.const 3)
            (i32.load (i32.shl (i32.sub (local.get $len) (i32.const 1)) (i32.const 2)))))
        (local.set $run
          (i32.load (i32.shl (local.get $i) (i32.const 2))))
        (loop $fill
          (i32.store (i32.shl (local.get $len) (i32.const 2)) (local.get $value))
          (local.set $len (i32.add (local.get $len) (i32.const 1)))
          (local.set $run (i32.sub (local.get $run) (i32.const 1)))
          (br_if $fill (i32.gt_s (local.get $run) (i32.const 0))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))
)
