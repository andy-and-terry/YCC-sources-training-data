(module
  ;; Euler zigzag numbers via the Seidel-Entringer boustrophedon.
  ;; zigzag(0..9) == 1 1 1 2 5 16 61 272 1385 7936
  ;; Two i64 rows live in linear memory: row at byte 0, next at byte 256.
  (memory 1)

  (func (export "zigzag") (param $n i32) (result i64)
    (local $i i32) (local $j i32) (local $len i32)
    (i64.store (i32.const 0) (i64.const 1))
    (local.set $len (i32.const 1))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_u (local.get $i) (local.get $n)))
        (i64.store (i32.const 256) (i64.const 0))
        ;; next[j] = next[j-1] + row[len-j] for j = 1..len
        (local.set $j (i32.const 1))
        (block $fill_done
          (loop $fill
            (br_if $fill_done (i32.gt_u (local.get $j) (local.get $len)))
            (i64.store
              (i32.add (i32.const 256) (i32.mul (local.get $j) (i32.const 8)))
              (i64.add
                (i64.load (i32.add (i32.const 248) (i32.mul (local.get $j) (i32.const 8))))
                (i64.load (i32.mul (i32.sub (local.get $len) (local.get $j)) (i32.const 8)))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $fill)))
        (local.set $len (i32.add (local.get $len) (i32.const 1)))
        ;; row = next
        (local.set $j (i32.const 0))
        (block $copy_done
          (loop $copy
            (br_if $copy_done (i32.ge_u (local.get $j) (local.get $len)))
            (i64.store (i32.mul (local.get $j) (i32.const 8))
              (i64.load (i32.add (i32.const 256) (i32.mul (local.get $j) (i32.const 8)))))
            (local.set $j (i32.add (local.get $j) (i32.const 1)))
            (br $copy)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer)))
    (i64.load (i32.mul (i32.sub (local.get $len) (i32.const 1)) (i32.const 8)))))
