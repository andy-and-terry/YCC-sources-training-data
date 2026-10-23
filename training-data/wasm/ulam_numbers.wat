(module
  (memory (export "memory") 1)

  (func $at (param $i i32) (result i32)
    (i32.load (i32.shl (local.get $i) (i32.const 2))))

  ;; Writes the first $count (>= 2) Ulam numbers as i32s at address 0.
  (func (export "ulam") (param $count i32)
    (local $len i32) (local $cand i32) (local $ways i32)
    (local $i i32) (local $j i32)
    (i32.store (i32.const 0) (i32.const 1))
    (i32.store (i32.const 4) (i32.const 2))
    (local.set $len (i32.const 2))
    (local.set $cand (i32.const 3))
    (block $done
      (loop $next
        (br_if $done (i32.ge_s (local.get $len) (local.get $count)))
        (local.set $ways (i32.const 0))
        (local.set $i (i32.const 0))
        (block $iend
          (loop $iloop
            (br_if $iend (i32.ge_s (local.get $i) (local.get $len)))
            (local.set $j (i32.add (local.get $i) (i32.const 1)))
            (block $jend
              (loop $jloop
                (br_if $jend (i32.ge_s (local.get $j) (local.get $len)))
                (if (i32.eq
                      (i32.add (call $at (local.get $i)) (call $at (local.get $j)))
                      (local.get $cand))
                  (then (local.set $ways (i32.add (local.get $ways) (i32.const 1)))))
                (local.set $j (i32.add (local.get $j) (i32.const 1)))
                (br $jloop)))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $iloop)))
        (if (i32.eq (local.get $ways) (i32.const 1))
          (then
            (i32.store (i32.shl (local.get $len) (i32.const 2)) (local.get $cand))
            (local.set $len (i32.add (local.get $len) (i32.const 1)))))
        (local.set $cand (i32.add (local.get $cand) (i32.const 1)))
        (br $next))))
)
