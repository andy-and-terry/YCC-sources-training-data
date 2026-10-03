(module
  (memory (export "memory") 1)

  ;; In-place 3-way partition of an i32 array holding only 0/1/2
  ;; values, using low/mid/high pointers (the Dutch national flag
  ;; problem).

  (func $swap (param $arr_base i32) (param $i i32) (param $j i32)
    (local $tmp i32)
    (local.set $tmp (i32.load (i32.add (local.get $arr_base) (i32.mul (local.get $i) (i32.const 4)))))
    (i32.store
      (i32.add (local.get $arr_base) (i32.mul (local.get $i) (i32.const 4)))
      (i32.load (i32.add (local.get $arr_base) (i32.mul (local.get $j) (i32.const 4)))))
    (i32.store (i32.add (local.get $arr_base) (i32.mul (local.get $j) (i32.const 4))) (local.get $tmp)))

  (func $dutch_flag (export "dutch_flag") (param $arr_base i32) (param $n i32)
    (local $low i32)
    (local $mid i32)
    (local $high i32)
    (local $v i32)
    (local.set $low (i32.const 0))
    (local.set $mid (i32.const 0))
    (local.set $high (i32.sub (local.get $n) (i32.const 1)))
    (block $done
      (loop $loop
        (br_if $done (i32.gt_s (local.get $mid) (local.get $high)))
        (local.set $v (i32.load (i32.add (local.get $arr_base) (i32.mul (local.get $mid) (i32.const 4)))))
        (if (i32.eqz (local.get $v))
          (then
            (call $swap (local.get $arr_base) (local.get $low) (local.get $mid))
            (local.set $low (i32.add (local.get $low) (i32.const 1)))
            (local.set $mid (i32.add (local.get $mid) (i32.const 1))))
          (else
            (if (i32.eq (local.get $v) (i32.const 1))
              (then (local.set $mid (i32.add (local.get $mid) (i32.const 1))))
              (else
                (call $swap (local.get $arr_base) (local.get $mid) (local.get $high))
                (local.set $high (i32.sub (local.get $high) (i32.const 1)))))))
        (br $loop))))
)
