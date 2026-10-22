(module
  (memory (export "memory") 1)

  ;; Writes the first $count terms (count >= 3) as i32s at address 0.
  (func $kolakoski (export "kolakoski") (param $count i32)
    (local $w i32) (local $r i32) (local $v i32) (local $k i32)
    (i32.store (i32.const 0) (i32.const 1))
    (i32.store (i32.const 4) (i32.const 2))
    (i32.store (i32.const 8) (i32.const 2))
    (local.set $w (i32.const 3))
    (local.set $r (i32.const 2))
    (local.set $v (i32.const 1))
    (block $done
      (loop $outer
        (br_if $done (i32.ge_s (local.get $w) (local.get $count)))
        (local.set $k (i32.load (i32.shl (local.get $r) (i32.const 2))))
        (loop $run
          (i32.store (i32.shl (local.get $w) (i32.const 2)) (local.get $v))
          (local.set $w (i32.add (local.get $w) (i32.const 1)))
          (local.set $k (i32.sub (local.get $k) (i32.const 1)))
          (br_if $run (i32.gt_s (local.get $k) (i32.const 0))))
        (local.set $v (i32.sub (i32.const 3) (local.get $v)))
        (local.set $r (i32.add (local.get $r) (i32.const 1)))
        (br $outer))))
)
