(module
  (memory (export "mem") 1)

  ;; Returns the first index where the sum to the left equals the sum to the right, or -1.
  ;; Array of i32 starts at byte offset `ptr`.
  (func $equilibrium_index (export "equilibrium_index") (param $ptr i32) (param $n i32) (result i32)
    (local $i i32) (local $total i32) (local $left i32) (local $v i32)
    (loop $sum
      (local.set $total
        (i32.add (local.get $total)
          (i32.load (i32.add (local.get $ptr) (i32.shl (local.get $i) (i32.const 2))))))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $sum (i32.lt_u (local.get $i) (local.get $n))))
    (local.set $i (i32.const 0))
    (loop $scan (result i32)
      (if (i32.ge_u (local.get $i) (local.get $n))
        (then (return (i32.const -1))))
      (local.set $v (i32.load (i32.add (local.get $ptr) (i32.shl (local.get $i) (i32.const 2)))))
      (if (i32.eq (local.get $left)
                  (i32.sub (i32.sub (local.get $total) (local.get $left)) (local.get $v)))
        (then (return (local.get $i))))
      (local.set $left (i32.add (local.get $left) (local.get $v)))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br $scan)))
)
