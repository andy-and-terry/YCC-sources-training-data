(module
  (memory (export "memory") 1)

  ;; a(n) lives at address 4*n, so slot 0 is unused (1-based indexing).
  (func $at (param $i i32) (result i32)
    (i32.load (i32.shl (local.get $i) (i32.const 2))))

  ;; Fills a(1)..a(count); a(n) = 1 + a(n - a(a(n - 1))).
  (func $golomb (export "golomb") (param $count i32)
    (local $n i32)
    (i32.store (i32.const 4) (i32.const 1))
    (local.set $n (i32.const 2))
    (block $done
      (loop $loop
        (br_if $done (i32.gt_s (local.get $n) (local.get $count)))
        (i32.store
          (i32.shl (local.get $n) (i32.const 2))
          (i32.add
            (i32.const 1)
            (call $at
              (i32.sub
                (local.get $n)
                (call $at (call $at (i32.sub (local.get $n) (i32.const 1))))))))
        (local.set $n (i32.add (local.get $n) (i32.const 1)))
        (br $loop))))
)
