(module
  ;; Reverse the decimal digits of n: 1234 -> 4321. Used by reverse-and-add.
  (func $reverse (export "reverse_digits") (param $n i64) (result i64)
    (local $r i64)
    (block $done
      (loop $again
        (br_if $done (i64.eqz (local.get $n)))
        (local.set $r
          (i64.add (i64.mul (local.get $r) (i64.const 10))
                   (i64.rem_u (local.get $n) (i64.const 10))))
        (local.set $n (i64.div_u (local.get $n) (i64.const 10)))
        (br $again)))
    (local.get $r))

  ;; Steps of reverse-and-add until a palindrome; steps(89) = 24, or -1.
  (func (export "lychrel_steps") (param $n i64) (result i32)
    (local $count i32)
    (block $fail
      (loop $again
        (br_if $fail (i32.ge_u (local.get $count) (i32.const 50)))
        (if (i32.and
              (i32.gt_u (local.get $count) (i32.const 0))
              (i64.eq (local.get $n) (call $reverse (local.get $n))))
          (then (return (local.get $count))))
        (local.set $n (i64.add (local.get $n) (call $reverse (local.get $n))))
        (local.set $count (i32.add (local.get $count) (i32.const 1)))
        (br $again)))
    (i32.const -1)))
