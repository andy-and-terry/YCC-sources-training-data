(module
  (memory (export "memory") 1)

  ;; Rolling-hash substring search: hashes text_base's first pattern_len
  ;; bytes and compares against pattern's hash, sliding the window one byte
  ;; at a time by removing the outgoing byte's contribution and adding the
  ;; incoming one, instead of rehashing the whole window (contrast with the
  ;; O(pattern_len) inner scan of kmp_search.wat's LPS table approach).
  (func $rabin_karp_search (export "rabin_karp_search")
        (param $text_base i32) (param $text_len i32)
        (param $pattern_base i32) (param $pattern_len i32) (result i32)
    (local $base i32)
    (local $modulus i32)
    (local $pattern_hash i32)
    (local $text_hash i32)
    (local $high_order i32)
    (local $i i32)
    (local $j i32)
    (local $match i32)
    (local.set $base (i32.const 256))
    (local.set $modulus (i32.const 101))
    (local.set $high_order (i32.const 1))
    (local.set $i (i32.const 0))
    (block $high_done
      (loop $high_loop
        (br_if $high_done (i32.ge_s (local.get $i) (i32.sub (local.get $pattern_len) (i32.const 1))))
        (local.set $high_order (i32.rem_s (i32.mul (local.get $high_order) (local.get $base)) (local.get $modulus)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $high_loop)))
    (local.set $pattern_hash (i32.const 0))
    (local.set $text_hash (i32.const 0))
    (local.set $i (i32.const 0))
    (block $hash_done
      (loop $hash_loop
        (br_if $hash_done (i32.ge_s (local.get $i) (local.get $pattern_len)))
        (local.set $pattern_hash
          (i32.rem_s
            (i32.add (i32.mul (local.get $pattern_hash) (local.get $base)) (i32.load8_u (i32.add (local.get $pattern_base) (local.get $i))))
            (local.get $modulus)))
        (local.set $text_hash
          (i32.rem_s
            (i32.add (i32.mul (local.get $text_hash) (local.get $base)) (i32.load8_u (i32.add (local.get $text_base) (local.get $i))))
            (local.get $modulus)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $hash_loop)))
    (local.set $i (i32.const 0))
    (block $search_done
      (loop $search_loop
        (br_if $search_done (i32.gt_s (local.get $i) (i32.sub (local.get $text_len) (local.get $pattern_len))))
        (if (i32.eq (local.get $pattern_hash) (local.get $text_hash))
          (then
            (local.set $match (i32.const 1))
            (local.set $j (i32.const 0))
            (block $cmp_done
              (loop $cmp_loop
                (br_if $cmp_done (i32.ge_s (local.get $j) (local.get $pattern_len)))
                (if (i32.ne (i32.load8_u (i32.add (local.get $text_base) (i32.add (local.get $i) (local.get $j))))
                            (i32.load8_u (i32.add (local.get $pattern_base) (local.get $j))))
                  (then
                    (local.set $match (i32.const 0))
                    (br $cmp_done)))
                (local.set $j (i32.add (local.get $j) (i32.const 1)))
                (br $cmp_loop)))
            (if (local.get $match)
              (then (return (local.get $i))))))
        (if (i32.lt_s (local.get $i) (i32.sub (local.get $text_len) (local.get $pattern_len)))
          (then
            (local.set $text_hash
              (i32.rem_s
                (i32.add
                  (i32.mul
                    (i32.sub (local.get $text_hash)
                      (i32.mul (i32.load8_u (i32.add (local.get $text_base) (local.get $i))) (local.get $high_order)))
                    (local.get $base))
                  (i32.load8_u (i32.add (local.get $text_base) (i32.add (local.get $i) (local.get $pattern_len)))))
                (local.get $modulus)))
            (if (i32.lt_s (local.get $text_hash) (i32.const 0))
              (then (local.set $text_hash (i32.add (local.get $text_hash) (local.get $modulus)))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $search_loop)))
    (i32.const -1))
)
