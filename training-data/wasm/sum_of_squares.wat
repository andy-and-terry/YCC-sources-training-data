(module
  (func (export "sum_squares") (param $n i32) (result i32)
    (local $i i32) (local $sum i32)
    (local.set $i (i32.const 1))
    (block $exit
      (loop $loop
        (br_if $exit (i32.gt_u (local.get $i) (local.get $n)))
        (local.set $sum
          (i32.add (local.get $sum) (i32.mul (local.get $i) (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (local.get $sum)))
