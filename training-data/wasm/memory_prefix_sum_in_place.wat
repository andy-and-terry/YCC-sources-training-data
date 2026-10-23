(module
  (memory (export "mem") 1)

  ;; in-place prefix sum over n i32 values starting at address 0
  (func (export "prefix_sum") (param $n i32)
    (local $i i32)
    (local.set $i (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (i32.store
          (i32.shl (local.get $i) (i32.const 2))
          (i32.add
            (i32.load (i32.shl (local.get $i) (i32.const 2)))
            (i32.load (i32.shl (i32.sub (local.get $i) (i32.const 1)) (i32.const 2)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next))))
)
