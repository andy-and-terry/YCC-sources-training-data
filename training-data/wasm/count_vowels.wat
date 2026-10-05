(module
  (memory (export "memory") 1)
  (data (i32.const 0) "WebAssembly rocks")

  ;; Returns 1 if the (lowercased) byte is a, e, i, o or u.
  (func $is_vowel (param $c i32) (result i32)
    (local.set $c (i32.or (local.get $c) (i32.const 0x20)))
    (i32.or
      (i32.or
        (i32.eq (local.get $c) (i32.const 97))
        (i32.eq (local.get $c) (i32.const 101)))
      (i32.or
        (i32.eq (local.get $c) (i32.const 105))
        (i32.or
          (i32.eq (local.get $c) (i32.const 111))
          (i32.eq (local.get $c) (i32.const 117))))))

  (func $count_vowels (export "count_vowels") (param $ptr i32) (param $len i32) (result i32)
    (local $i i32)
    (local $n i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $len)))
        (local.set $n
          (i32.add (local.get $n)
            (call $is_vowel (i32.load8_u (i32.add (local.get $ptr) (local.get $i))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $n))
)
