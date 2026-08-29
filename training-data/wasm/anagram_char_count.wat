(module
  (memory (export "memory") 1)

  (func $is_anagram (export "is_anagram")
        (param $a_base i32) (param $a_len i32) (param $b_base i32) (param $b_len i32) (result i32)
    (local $counts_base i32)
    (local $i i32)
    (local $c i32)
    (local.set $counts_base (i32.const 11000))
    (if (result i32) (i32.ne (local.get $a_len) (local.get $b_len))
      (then (i32.const 0))
      (else
        (local.set $i (i32.const 0))
        (block $clear_done
          (loop $clear
            (br_if $clear_done (i32.ge_s (local.get $i) (i32.const 256)))
            (i32.store (i32.add (local.get $counts_base) (i32.mul (local.get $i) (i32.const 4))) (i32.const 0))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $clear)))
        (local.set $i (i32.const 0))
        (block $count_a_done
          (loop $count_a
            (br_if $count_a_done (i32.ge_s (local.get $i) (local.get $a_len)))
            (local.set $c (i32.load8_u (i32.add (local.get $a_base) (local.get $i))))
            (i32.store (i32.add (local.get $counts_base) (i32.mul (local.get $c) (i32.const 4)))
              (i32.add (i32.load (i32.add (local.get $counts_base) (i32.mul (local.get $c) (i32.const 4)))) (i32.const 1)))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $count_a)))
        (local.set $i (i32.const 0))
        (block $count_b_done
          (loop $count_b
            (br_if $count_b_done (i32.ge_s (local.get $i) (local.get $b_len)))
            (local.set $c (i32.load8_u (i32.add (local.get $b_base) (local.get $i))))
            (i32.store (i32.add (local.get $counts_base) (i32.mul (local.get $c) (i32.const 4)))
              (i32.sub (i32.load (i32.add (local.get $counts_base) (i32.mul (local.get $c) (i32.const 4)))) (i32.const 1)))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $count_b)))
        (local.set $i (i32.const 0))
        (block $check_done (result i32)
          (loop $check (result i32)
            (if (result i32) (i32.ge_s (local.get $i) (i32.const 256))
              (then (i32.const 1))
              (else
                (if (result i32) (i32.ne (i32.load (i32.add (local.get $counts_base) (i32.mul (local.get $i) (i32.const 4)))) (i32.const 0))
                  (then (i32.const 0))
                  (else
                    (local.set $i (i32.add (local.get $i) (i32.const 1)))
                    (br $check))))))))))
)
