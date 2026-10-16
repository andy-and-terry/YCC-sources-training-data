(module
  ;; Smallest power of two >= n (n >= 1), computed with clz.
  (func $next_pow2 (export "next_pow2") (param $n i32) (result i32)
    (if (result i32) (i32.le_u (local.get $n) (i32.const 1))
      (then (i32.const 1))
      (else
        (i32.shl
          (i32.const 1)
          (i32.sub (i32.const 32)
            (i32.clz (i32.sub (local.get $n) (i32.const 1)))))))))
