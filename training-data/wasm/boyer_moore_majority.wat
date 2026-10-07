(module
  (memory (export "memory") 1)

  ;; Boyer-Moore majority vote over an i32 array: returns the element
  ;; appearing more than n/2 times, or -1 if no such element exists.

  (func $majority_element (export "majority_element") (param $arr_base i32) (param $n i32) (result i32)
    (local $i i32)
    (local $candidate i32)
    (local $count i32)
    (local $v i32)
    (local $occurrences i32)
    (local.set $count (i32.const 0))
    (local.set $i (i32.const 0))
    (block $vote_done
      (loop $vote_loop
        (br_if $vote_done (i32.ge_s (local.get $i) (local.get $n)))
        (local.set $v (i32.load (i32.add (local.get $arr_base) (i32.mul (local.get $i) (i32.const 4)))))
        (if (i32.eqz (local.get $count))
          (then
            (local.set $candidate (local.get $v))
            (local.set $count (i32.const 1)))
          (else
            (if (i32.eq (local.get $v) (local.get $candidate))
              (then (local.set $count (i32.add (local.get $count) (i32.const 1))))
              (else (local.set $count (i32.sub (local.get $count) (i32.const 1)))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $vote_loop)))

    (local.set $occurrences (i32.const 0))
    (local.set $i (i32.const 0))
    (block $count_done
      (loop $count_loop
        (br_if $count_done (i32.ge_s (local.get $i) (local.get $n)))
        (if (i32.eq (i32.load (i32.add (local.get $arr_base) (i32.mul (local.get $i) (i32.const 4)))) (local.get $candidate))
          (then (local.set $occurrences (i32.add (local.get $occurrences) (i32.const 1)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $count_loop)))

    (if (result i32) (i32.gt_s (i32.mul (local.get $occurrences) (i32.const 2)) (local.get $n))
      (then (local.get $candidate))
      (else (i32.const -1))))
)
