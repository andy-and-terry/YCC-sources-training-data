(module
  (memory (export "memory") 1)

  ;; Writes the lucky numbers up to $limit as i32s at address 0 and returns how many.
  (func $lucky (export "lucky") (param $limit i32) (result i32)
    (local $len i32) (local $idx i32) (local $step i32)
    (local $kept i32) (local $j i32) (local $n i32)
    (local.set $n (i32.const 1))
    (block $odd_done
      (loop $odd
        (br_if $odd_done (i32.gt_s (local.get $n) (local.get $limit)))
        (i32.store (i32.shl (local.get $len) (i32.const 2)) (local.get $n))
        (local.set $len (i32.add (local.get $len) (i32.const 1)))
        (local.set $n (i32.add (local.get $n) (i32.const 2)))
        (br $odd)))
    (local.set $idx (i32.const 1))
    (block $done
      (loop $sieve
        (br_if $done (i32.ge_s (local.get $idx) (local.get $len)))
        (local.set $step (i32.load (i32.shl (local.get $idx) (i32.const 2))))
        (br_if $done (i32.gt_s (local.get $step) (local.get $len)))
        (local.set $kept (i32.const 0))
        (local.set $j (i32.const 0))
        (block $scan_done
          (loop $scan
            (br_if $scan_done (i32.ge_s (local.get $j) (local.get $len)))
            (if (i32.rem_s (i32.add (local.get $j) (i32.const 1)) (local.get $step))
              (then
                (i32.store (i32.shl (local.get $kept) (i32.const 2))
                           (i32.load (i32.shl (local.get $j) (i32.const 2))))
                (local.set $kept (i32.add (local.get $kept) (i32.const 1)))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $scan)))
        (local.set $len (local.get $kept))
        (local.set $idx (i32.add (local.get $idx) (i32.const 1)))
        (br $sieve)))
    (local.get $len))
)
