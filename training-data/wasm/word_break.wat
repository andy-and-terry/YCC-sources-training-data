(module
  (memory (export "memory") 1)

  ;; Compares `len` bytes starting at base_a+off_a against base_b+off_b.
  (func $bytes_equal (export "bytes_equal")
        (param $base_a i32) (param $off_a i32) (param $base_b i32) (param $off_b i32) (param $len i32) (result i32)
    (local $i i32)
    (local.set $i (i32.const 0))
    (block $mismatch
      (loop $loop
        (br_if $mismatch (i32.ge_s (local.get $i) (local.get $len)))
        (br_if $mismatch
          (i32.ne
            (i32.load8_u (i32.add (i32.add (local.get $base_a) (local.get $off_a)) (local.get $i)))
            (i32.load8_u (i32.add (i32.add (local.get $base_b) (local.get $off_b)) (local.get $i)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop))
      (return (i32.const 1)))
    (i32.const 0))

  ;; Word Break DP: can s[0..s_len) be segmented into dictionary words?
  ;; Dictionary words live concatenated in word_data starting at
  ;; dict_offsets[k], each dict_lengths[k] bytes long. dp_base must point
  ;; to s_len+1 zeroed bytes; dp[0] (the empty prefix) is set here.
  (func $can_break (export "can_break")
        (param $s_base i32) (param $s_len i32)
        (param $word_data_base i32) (param $dict_offsets_base i32) (param $dict_lengths_base i32) (param $dict_count i32)
        (param $dp_base i32) (result i32)
    (local $i i32)
    (local $k i32)
    (local $wlen i32)
    (local $woff i32)
    (i32.store8 (local.get $dp_base) (i32.const 1))
    (local.set $i (i32.const 1))
    (block $i_done
      (loop $i_loop
        (br_if $i_done (i32.gt_s (local.get $i) (local.get $s_len)))
        (local.set $k (i32.const 0))
        (block $k_done
          (loop $k_loop
            (br_if $k_done (i32.ge_s (local.get $k) (local.get $dict_count)))
            (local.set $wlen (i32.load (i32.add (local.get $dict_lengths_base) (i32.mul (local.get $k) (i32.const 4)))))
            (if (i32.and
                  (i32.le_s (local.get $wlen) (local.get $i))
                  (i32.load8_u (i32.add (local.get $dp_base) (i32.sub (local.get $i) (local.get $wlen)))))
              (then
                (local.set $woff (i32.load (i32.add (local.get $dict_offsets_base) (i32.mul (local.get $k) (i32.const 4)))))
                (if (call $bytes_equal (local.get $s_base) (i32.sub (local.get $i) (local.get $wlen)) (local.get $word_data_base) (local.get $woff) (local.get $wlen))
                  (then (i32.store8 (i32.add (local.get $dp_base) (local.get $i)) (i32.const 1))))))
            (local.set $k (i32.add (local.get $k) (i32.const 1)))
            (br $k_loop)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $i_loop)))
    (i32.load8_u (i32.add (local.get $dp_base) (local.get $s_len))))
)
