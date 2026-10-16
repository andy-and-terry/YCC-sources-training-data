(module
  (memory (export "memory") 1)
  (data (i32.const 0) "\01\00\00\00\03\00\00\00\03\00\00\00\09\00\00\00")

  ;; Returns 1 if the i32 array at ptr is non-decreasing.
  (func $is_sorted (export "is_sorted") (param $ptr i32) (param $n i32) (result i32)
    (local $i i32)
    (local.set $i (i32.const 1))
    (block $done
      (loop $l
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (if (i32.gt_s
              (i32.load (i32.add (local.get $ptr) (i32.mul (i32.sub (local.get $i) (i32.const 1)) (i32.const 4))))
              (i32.load (i32.add (local.get $ptr) (i32.mul (local.get $i) (i32.const 4)))))
          (then (return (i32.const 0))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $l)))
    (i32.const 1)))
