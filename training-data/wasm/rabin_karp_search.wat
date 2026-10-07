(module
  (memory (export "memory") 1)

  (func $rabin_karp_search (export "rabin_karp_search")
        (param $text_base i32) (param $n i32) (param $pattern_base i32) (param $m i32) (result i32)
    (local $base_val i32)
    (local $modulus i32)
    (local $h i32)
    (local $pattern_hash i32)
    (local $window_hash i32)
    (local $i i32)
    (local $j i32)
    (local $match i32)
    (local $result i32)
    (local.set $base_val (i32.const 256))
    (local.set $modulus (i32.const 101))
    (local.set $result (i32.const -1))
    (if (i32.or (i32.eqz (local.get $m)) (i32.gt_s (local.get $m) (local.get $n)))
      (then (return (local.get $result))))
    (local.set $h (i32.const 1))
    (local.set $i (i32.const 0))
    (block $h_done
      (loop $h_loop
        (br_if $h_done (i32.ge_s (local.get $i) (i32.sub (local.get $m) (i32.const 1))))
        (local.set $h (i32.rem_u (i32.mul (local.get $h) (local.get $base_val)) (local.get $modulus)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $h_loop)))
    (local.set $pattern_hash (i32.const 0))
    (local.set $window_hash (i32.const 0))
    (local.set $i (i32.const 0))
    (block $init_done
      (loop $init_loop
        (br_if $init_done (i32.ge_s (local.get $i) (local.get $m)))
        (local.set $pattern_hash
          (i32.rem_u
            (i32.add (i32.mul (local.get $pattern_hash) (local.get $base_val)) (i32.load8_u (i32.add (local.get $pattern_base) (local.get $i))))
            (local.get $modulus)))
        (local.set $window_hash
          (i32.rem_u
            (i32.add (i32.mul (local.get $window_hash) (local.get $base_val)) (i32.load8_u (i32.add (local.get $text_base) (local.get $i))))
            (local.get $modulus)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $init_loop)))
    (local.set $i (i32.const 0))
    (block $outer_done
      (loop $outer
        (if (i32.eq (local.get $window_hash) (local.get $pattern_hash))
          (then
            (local.set $match (i32.const 1))
            (local.set $j (i32.const 0))
            (block $cmp_done
              (loop $cmp
                (br_if $cmp_done (i32.ge_s (local.get $j) (local.get $m)))
                (if (i32.ne
                      (i32.load8_u (i32.add (local.get $text_base) (i32.add (local.get $i) (local.get $j))))
                      (i32.load8_u (i32.add (local.get $pattern_base) (local.get $j))))
                  (then
                    (local.set $match (i32.const 0))
                    (br $cmp_done)))
                (local.set $j (i32.add (local.get $j) (i32.const 1)))
                (br $cmp)))
            (if (local.get $match)
              (then
                (local.set $result (local.get $i))
                (br $outer_done)))))
        (br_if $outer_done (i32.ge_s (i32.add (local.get $i) (local.get $m)) (local.get $n)))
        (local.set $window_hash
          (i32.rem_u
            (i32.add
              (i32.mul
                (i32.add
                  (i32.sub (local.get $window_hash) (i32.rem_u (i32.mul (i32.load8_u (i32.add (local.get $text_base) (local.get $i))) (local.get $h)) (local.get $modulus)))
                  (local.get $modulus))
                (local.get $base_val))
              (i32.load8_u (i32.add (local.get $text_base) (i32.add (local.get $i) (local.get $m)))))
            (local.get $modulus)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (local.get $result))
)
