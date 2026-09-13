(module
  (memory (export "memory") 1)

  ;; each token >= 0 is a literal operand; negative tokens select an operator:
  ;; -1 = add, -2 = sub, -3 = mul, -4 = div. the evaluation stack lives at
  ;; byte offset 1000, separate from the token array passed in.
  (func $eval_rpn (export "eval_rpn") (param $base i32) (param $len i32) (result i32)
    (local $i i32)
    (local $sp i32)
    (local $token i32)
    (local $rhs i32)
    (local $lhs i32)
    (local.set $i (i32.const 0))
    (local.set $sp (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $token (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (if (i32.ge_s (local.get $token) (i32.const 0))
          (then
            (i32.store (i32.add (i32.const 1000) (i32.mul (local.get $sp) (i32.const 4))) (local.get $token))
            (local.set $sp (i32.add (local.get $sp) (i32.const 1))))
          (else
            (local.set $sp (i32.sub (local.get $sp) (i32.const 1)))
            (local.set $rhs (i32.load (i32.add (i32.const 1000) (i32.mul (local.get $sp) (i32.const 4)))))
            (local.set $sp (i32.sub (local.get $sp) (i32.const 1)))
            (local.set $lhs (i32.load (i32.add (i32.const 1000) (i32.mul (local.get $sp) (i32.const 4)))))
            (if (i32.eq (local.get $token) (i32.const -1))
              (then (local.set $lhs (i32.add (local.get $lhs) (local.get $rhs)))))
            (if (i32.eq (local.get $token) (i32.const -2))
              (then (local.set $lhs (i32.sub (local.get $lhs) (local.get $rhs)))))
            (if (i32.eq (local.get $token) (i32.const -3))
              (then (local.set $lhs (i32.mul (local.get $lhs) (local.get $rhs)))))
            (if (i32.eq (local.get $token) (i32.const -4))
              (then (local.set $lhs (i32.div_s (local.get $lhs) (local.get $rhs)))))
            (i32.store (i32.add (i32.const 1000) (i32.mul (local.get $sp) (i32.const 4))) (local.get $lhs))
            (local.set $sp (i32.add (local.get $sp) (i32.const 1)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (i32.load (i32.const 1000)))
)
