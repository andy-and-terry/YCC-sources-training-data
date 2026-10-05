(module
  (memory (export "memory") 1)

  ;; Dot product of two f64 vectors stored at byte offsets a and b.
  (func $dot (export "dot") (param $a i32) (param $b i32) (param $len i32) (result f64)
    (local $i i32)
    (local $sum f64)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $len)))
        (local.set $sum
          (f64.add
            (local.get $sum)
            (f64.mul
              (f64.load (i32.add (local.get $a) (i32.shl (local.get $i) (i32.const 3))))
              (f64.load (i32.add (local.get $b) (i32.shl (local.get $i) (i32.const 3)))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $sum))
)
