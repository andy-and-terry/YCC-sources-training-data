(module
  (memory (export "memory") 1)

  ;; Number of ways $c is a sum of two distinct terms among the first $len.
  (func $ways (param $len i32) (param $c i32) (result i32)
    (local $i i32) (local $j i32) (local $ways i32)
    (block $i_done
      (loop $i_loop
        (br_if $i_done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $j (i32.add (local.get $i) (i32.const 1)))
        (block $j_done
          (loop $j_loop
            (br_if $j_done (i32.ge_s (local.get $j) (local.get $len)))
            (if (i32.eq
                  (i32.add (i32.load (i32.shl (local.get $i) (i32.const 2)))
                           (i32.load (i32.shl (local.get $j) (i32.const 2))))
                  (local.get $c))
              (then (local.set $ways (i32.add (local.get $ways) (i32.const 1)))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $j_loop)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $i_loop)))
    (local.get $ways))

  ;; Writes the first $count Ulam numbers as i32s at address 0.
  (func $ulam (export "ulam") (param $count i32)
    (local $len i32) (local $c i32)
    (i32.store (i32.const 0) (i32.const 1))
    (i32.store (i32.const 4) (i32.const 2))
    (local.set $len (i32.const 2))
    (local.set $c (i32.const 3))
    (block $done
      (loop $next
        (br_if $done (i32.ge_s (local.get $len) (local.get $count)))
        (if (i32.eq (call $ways (local.get $len) (local.get $c)) (i32.const 1))
          (then
            (i32.store (i32.shl (local.get $len) (i32.const 2)) (local.get $c))
            (local.set $len (i32.add (local.get $len) (i32.const 1)))))
        (local.set $c (i32.add (local.get $c) (i32.const 1)))
        (br $next))))
)
