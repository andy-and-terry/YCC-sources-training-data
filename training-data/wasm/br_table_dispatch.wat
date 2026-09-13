(module
  (func $dispatch (export "dispatch") (param $op i32) (param $a i32) (param $b i32) (result i32)
    (block $default
      (block $div
        (block $mul
          (block $sub
            (block $add
              (br_table $add $sub $mul $div $default (local.get $op)))
            (return (i32.add (local.get $a) (local.get $b))))
          (return (i32.sub (local.get $a) (local.get $b))))
        (return (i32.mul (local.get $a) (local.get $b))))
      (return (i32.div_s (local.get $a) (local.get $b))))
    (i32.const -1))
)
