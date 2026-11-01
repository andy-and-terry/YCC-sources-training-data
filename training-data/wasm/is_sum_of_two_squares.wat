(module
  ;; Can n be written as a*a + b*b with a, b >= 0?
  (func (export "is_sum_of_two_squares") (param $n i32) (result i32)
    (local $a i32)
    (local $b i32)
    (block $exit
      (loop $outer
        (br_if $exit (i32.gt_u (i32.mul (local.get $a) (local.get $a)) (local.get $n)))
        (local.set $b (local.get $a))
        (block $next_a
          (loop $inner
            (br_if $next_a
              (i32.gt_u
                (i32.add (i32.mul (local.get $a) (local.get $a))
                         (i32.mul (local.get $b) (local.get $b)))
                (local.get $n)))
            (if (i32.eq
                  (i32.add (i32.mul (local.get $a) (local.get $a))
                           (i32.mul (local.get $b) (local.get $b)))
                  (local.get $n))
              (then (return (i32.const 1))))
            (local.set $b (i32.add (local.get $b) (i32.const 1)))
            (br $inner)))
        (local.set $a (i32.add (local.get $a) (i32.const 1)))
        (br $outer)))
    (i32.const 0)))
