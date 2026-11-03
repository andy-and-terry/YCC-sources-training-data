(module
  (memory 1)
  (func $count_primes_below (export "count_primes_below") (param $n i32) (result i32)
    (local $i i32) (local $j i32) (local $count i32)
    (local.set $i (i32.const 2))
    (block $end
      (loop $outer
        (br_if $end (i32.ge_u (local.get $i) (local.get $n)))
        (if (i32.eqz (i32.load8_u (local.get $i)))
          (then
            (local.set $count (i32.add (local.get $count) (i32.const 1)))
            (local.set $j (i32.mul (local.get $i) (local.get $i)))
            (block $inner_done
              (loop $inner
                (br_if $inner_done (i32.ge_u (local.get $j) (local.get $n)))
                (i32.store8 (local.get $j) (i32.const 1))
                (local.set $j (i32.add (local.get $j) (local.get $i)))
                (br $inner)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (local.get $count)))
