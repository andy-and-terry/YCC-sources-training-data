(module
  (func $classify (export "classify") (param $code i32) (result i32)
    (block $default
      (block $case3
        (block $case2
          (block $case1
            (block $case0
              (br_table $case0 $case1 $case2 $case3 $default (local.get $code)))
            (return (i32.const 100)))
          (return (i32.const 200)))
        (return (i32.const 300)))
      (return (i32.const 400)))
    (i32.const -1))
)
