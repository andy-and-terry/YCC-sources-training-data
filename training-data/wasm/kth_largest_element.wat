(module
  (memory (export "memory") 1)

  ;; Kth largest element (1 = largest) via k passes of "find and
  ;; remove the current maximum among the not-yet-removed entries",
  ;; tracked with a scratch byte array at removed_base (one byte per
  ;; element, nonzero means already picked).

  (func $kth_largest (export "kth_largest") (param $arr_base i32) (param $removed_base i32) (param $n i32) (param $k i32) (result i32)
    (local $pass i32)
    (local $i i32)
    (local $best_idx i32)
    (local $best_val i32)
    (local $v i32)

    (local.set $i (i32.const 0))
    (block $clear_done
      (loop $clear
        (br_if $clear_done (i32.ge_s (local.get $i) (local.get $n)))
        (i32.store8 (i32.add (local.get $removed_base) (local.get $i)) (i32.const 0))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $clear)))

    (local.set $pass (i32.const 0))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $pass) (local.get $k)))
        (local.set $best_idx (i32.const -1))
        (local.set $best_val (i32.const -2147483648))
        (local.set $i (i32.const 0))
        (block $inner_done
          (loop $inner
            (br_if $inner_done (i32.ge_s (local.get $i) (local.get $n)))
            (if (i32.eqz (i32.load8_u (i32.add (local.get $removed_base) (local.get $i))))
              (then
                (local.set $v (i32.load (i32.add (local.get $arr_base) (i32.mul (local.get $i) (i32.const 4)))))
                (if (i32.gt_s (local.get $v) (local.get $best_val))
                  (then
                    (local.set $best_val (local.get $v))
                    (local.set $best_idx (local.get $i))))))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $inner)))
        (i32.store8 (i32.add (local.get $removed_base) (local.get $best_idx)) (i32.const 1))
        (local.set $pass (i32.add (local.get $pass) (i32.const 1)))
        (br $outer)))
    (local.get $best_val))
)
