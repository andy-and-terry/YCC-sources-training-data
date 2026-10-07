(module
  ;; if/else as an expression producing a value
  (func (export "sign") (param $x i32) (result i32)
    (if (result i32) (i32.lt_s (local.get $x) (i32.const 0))
      (then (i32.const -1))
      (else
        (if (result i32) (i32.eqz (local.get $x))
          (then (i32.const 0))
          (else (i32.const 1))))))

  (func (export "abs") (param $x i32) (result i32)
    (if (result i32) (i32.lt_s (local.get $x) (i32.const 0))
      (then (i32.sub (i32.const 0) (local.get $x)))
      (else (local.get $x))))

  ;; A block can also yield a value through br
  (func (export "first_nonzero") (param $a i32) (param $b i32) (result i32)
    (block $found (result i32)
      (drop (br_if $found (local.get $a) (i32.ne (local.get $a) (i32.const 0))))
      (local.get $b)))
)
