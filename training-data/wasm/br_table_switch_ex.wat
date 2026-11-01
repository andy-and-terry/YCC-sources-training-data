(module
  (func (export "name_len") (param $i i32) (result i32)
    (block $d (block $c (block $b (block $a
      (br_table $a $b $c $d (local.get $i)))
      (return (i32.const 3)))
      (return (i32.const 4)))
      (return (i32.const 5)))
    (i32.const 0)))
