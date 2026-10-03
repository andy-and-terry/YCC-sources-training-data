(module
  (memory (export "memory") 1)

  ;; Longest common prefix length shared by `count` strings, given as
  ;; parallel arrays of base pointers (ptrs_base) and lengths
  ;; (lens_base), both arrays of i32. Compares column by column across
  ;; all strings at once, stopping at the first mismatch or the
  ;; shortest string's end.

  (func $common_prefix_len (export "common_prefix_len") (param $ptrs_base i32) (param $lens_base i32) (param $count i32) (result i32)
    (local $col i32)
    (local $s i32)
    (local $first_ptr i32)
    (local $ch i32)
    (local $ptr_s i32)
    (local $ok i32)
    (local.set $col (i32.const 0))
    (block $outer_done
      (loop $outer
        (local.set $ok (i32.const 1))
        (local.set $s (i32.const 0))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_s (local.get $s) (local.get $count)))
            (if (i32.ge_s (local.get $col) (i32.load (i32.add (local.get $lens_base) (i32.mul (local.get $s) (i32.const 4)))))
              (then (local.set $ok (i32.const 0)) (br $inner_done)))
            (local.set $ptr_s (i32.load (i32.add (local.get $ptrs_base) (i32.mul (local.get $s) (i32.const 4)))))
            (if (i32.eqz (local.get $s))
              (then (local.set $first_ptr (local.get $ptr_s)))
              (else
                (local.set $ch (i32.load8_u (i32.add (local.get $ptr_s) (local.get $col))))
                (if (i32.ne (local.get $ch) (i32.load8_u (i32.add (local.get $first_ptr) (local.get $col))))
                  (then (local.set $ok (i32.const 0)) (br $inner_done)))))
            (local.set $s (i32.add (local.get $s) (i32.const 1)))
            (br $inner)))
        (br_if $outer_done (i32.eqz (local.get $ok)))
        (local.set $col (i32.add (local.get $col) (i32.const 1)))
        (br $outer)))
    (local.get $col))
)
