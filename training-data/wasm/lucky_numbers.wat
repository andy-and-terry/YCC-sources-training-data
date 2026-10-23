(module
  (memory (export "memory") 1)

  (func $at (param $i i32) (result i32)
    (i32.load (i32.shl (local.get $i) (i32.const 2))))

  ;; Writes the lucky numbers below 100 as i32s at address 0 and returns how
  ;; many there are (23).
  (func (export "lucky") (result i32)
    (local $len i32) (local $idx i32) (local $step i32)
    (local $k i32) (local $kept i32)
    (loop $init
      (i32.store
        (i32.shl (local.get $k) (i32.const 2))
        (i32.add (i32.shl (local.get $k) (i32.const 1)) (i32.const 1)))
      (local.set $k (i32.add (local.get $k) (i32.const 1)))
      (br_if $init (i32.lt_s (local.get $k) (i32.const 50))))
    (local.set $len (i32.const 50))
    (local.set $idx (i32.const 1))
    (block $done
      (loop $sieve
        (br_if $done (i32.ge_s (local.get $idx) (local.get $len)))
        (local.set $step (call $at (local.get $idx)))
        (br_if $done (i32.gt_s (local.get $step) (local.get $len)))
        (local.set $kept (i32.const 0))
        (local.set $k (i32.const 0))
        (block $cend
          (loop $compact
            (br_if $cend (i32.ge_s (local.get $k) (local.get $len)))
            (if (i32.ne
                  (i32.rem_u (i32.add (local.get $k) (i32.const 1)) (local.get $step))
                  (i32.const 0))
              (then
                (i32.store
                  (i32.shl (local.get $kept) (i32.const 2))
                  (call $at (local.get $k)))
                (local.set $kept (i32.add (local.get $kept) (i32.const 1)))))
            (local.set $k (i32.add (local.get $k) (i32.const 1)))
            (br $compact)))
        (local.set $len (local.get $kept))
        (local.set $idx (i32.add (local.get $idx) (i32.const 1)))
        (br $sieve)))
    (local.get $len))
)
