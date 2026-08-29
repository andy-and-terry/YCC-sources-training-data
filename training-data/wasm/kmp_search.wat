(module
  (memory (export "memory") 1)

  (func $build_lps (export "build_lps") (param $pattern_base i32) (param $m i32) (param $lps_base i32)
    (local $len i32)
    (local $i i32)
    (i32.store (local.get $lps_base) (i32.const 0))
    (local.set $len (i32.const 0))
    (local.set $i (i32.const 1))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $m)))
        (if (i32.eq
              (i32.load8_u (i32.add (local.get $pattern_base) (local.get $i)))
              (i32.load8_u (i32.add (local.get $pattern_base) (local.get $len))))
          (then
            (local.set $len (i32.add (local.get $len) (i32.const 1)))
            (i32.store (i32.add (local.get $lps_base) (i32.mul (local.get $i) (i32.const 4))) (local.get $len))
            (local.set $i (i32.add (local.get $i) (i32.const 1))))
          (else
            (if (i32.ne (local.get $len) (i32.const 0))
              (then (local.set $len (i32.load (i32.add (local.get $lps_base) (i32.mul (i32.sub (local.get $len) (i32.const 1)) (i32.const 4))))))
              (else
                (i32.store (i32.add (local.get $lps_base) (i32.mul (local.get $i) (i32.const 4))) (i32.const 0))
                (local.set $i (i32.add (local.get $i) (i32.const 1)))))))
        (br $loop))))

  (func $kmp_search (export "kmp_search")
        (param $text_base i32) (param $n i32) (param $pattern_base i32) (param $m i32) (param $lps_base i32) (result i32)
    (local $i i32)
    (local $j i32)
    (local.set $i (i32.const 0))
    (local.set $j (i32.const 0))
    (block $found (result i32)
      (loop $loop (result i32)
        (if (result i32) (i32.ge_s (local.get $i) (local.get $n))
          (then (i32.const -1))
          (else
            (if (result i32) (i32.eq
                  (i32.load8_u (i32.add (local.get $text_base) (local.get $i)))
                  (i32.load8_u (i32.add (local.get $pattern_base) (local.get $j))))
              (then
                (local.set $i (i32.add (local.get $i) (i32.const 1)))
                (local.set $j (i32.add (local.get $j) (i32.const 1)))
                (if (result i32) (i32.eq (local.get $j) (local.get $m))
                  (then (i32.sub (local.get $i) (local.get $j)))
                  (else (br $loop))))
              (else
                (if (result i32) (i32.gt_s (local.get $j) (i32.const 0))
                  (then
                    (local.set $j (i32.load (i32.add (local.get $lps_base) (i32.mul (i32.sub (local.get $j) (i32.const 1)) (i32.const 4)))))
                    (br $loop))
                  (else
                    (local.set $i (i32.add (local.get $i) (i32.const 1)))
                    (br $loop))))))))))
)
