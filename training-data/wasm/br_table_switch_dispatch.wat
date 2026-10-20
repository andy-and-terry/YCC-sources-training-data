(module
  (func (export "day_kind") (param $d i32) (result i32)
    (block $weekend
      (block $weekday
        (block $invalid
          (br_table $weekday $weekday $weekday $weekday $weekday $weekend $weekend $invalid (local.get $d)))
        (return (i32.const -1)))
      (return (i32.const 1)))
    (i32.const 2)))
