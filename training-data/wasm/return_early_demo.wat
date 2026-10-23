(module
  ;; Returns the first argument divided by the second, or -1 on divide by zero
  (func (export "safe_div") (param $a i32) (param $b i32) (result i32)
    (if (i32.eqz (local.get $b))
      (then (return (i32.const -1))))
    (i32.div_s (local.get $a) (local.get $b)))

  ;; Index of first negative element in a 3-slot window, or -1
  (func (export "first_negative") (param $a i32) (param $b i32) (param $c i32) (result i32)
    (if (i32.lt_s (local.get $a) (i32.const 0)) (then (return (i32.const 0))))
    (if (i32.lt_s (local.get $b) (i32.const 0)) (then (return (i32.const 1))))
    (if (i32.lt_s (local.get $c) (i32.const 0)) (then (return (i32.const 2))))
    (i32.const -1))
)
