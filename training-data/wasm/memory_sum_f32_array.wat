(module
  (memory (export "memory") 1)
  (data (i32.const 0) "\00\00\80\3f\00\00\00\40\00\00\40\40\00\00\80\40") ;; 1.0 2.0 3.0 4.0

  (func $sum_f32 (export "sum_f32") (param $count i32) (result f32)
    (local $i i32) (local $acc f32)
    (block $done
      (loop $l
        (br_if $done (i32.ge_u (local.get $i) (local.get $count)))
        (local.set $acc
          (f32.add (local.get $acc)
                   (f32.load (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $l)))
    (local.get $acc)))
