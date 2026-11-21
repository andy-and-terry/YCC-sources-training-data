(module
  ;; Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
  ;; The sequence lives in linear memory (i32 slots).
  (memory 1)

  (func (export "is_keith") (param $n i32) (result i32)
    (local $k i32) (local $len i32) (local $m i32) (local $i i32) (local $sum i32)
    ;; count digits
    (local.set $m (local.get $n))
    (block $counted
      (loop $count
        (br_if $counted (i32.eqz (local.get $m)))
        (local.set $k (i32.add (local.get $k) (i32.const 1)))
        (local.set $m (i32.div_u (local.get $m) (i32.const 10)))
        (br $count)))
    ;; store digits most-significant first
    (local.set $m (local.get $n))
    (local.set $i (local.get $k))
    (block $stored
      (loop $store
        (br_if $stored (i32.eqz (local.get $i)))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (i32.store
          (i32.shl (local.get $i) (i32.const 2))
          (i32.rem_u (local.get $m) (i32.const 10)))
        (local.set $m (i32.div_u (local.get $m) (i32.const 10)))
        (br $store)))
    (local.set $len (local.get $k))
    ;; extend the sequence until the last term >= n
    (block $grown
      (loop $grow
        (br_if $grown
          (i32.ge_u
            (i32.load (i32.shl (i32.sub (local.get $len) (i32.const 1)) (i32.const 2)))
            (local.get $n)))
        (local.set $sum (i32.const 0))
        (local.set $i (i32.sub (local.get $len) (local.get $k)))
        (block $summed
          (loop $add
            (br_if $summed (i32.ge_u (local.get $i) (local.get $len)))
            (local.set $sum
              (i32.add (local.get $sum) (i32.load (i32.shl (local.get $i) (i32.const 2)))))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $add)))
        (i32.store (i32.shl (local.get $len) (i32.const 2)) (local.get $sum))
        (local.set $len (i32.add (local.get $len) (i32.const 1)))
        (br $grow)))
    (i32.eq
      (i32.load (i32.shl (i32.sub (local.get $len) (i32.const 1)) (i32.const 2)))
      (local.get $n))))
