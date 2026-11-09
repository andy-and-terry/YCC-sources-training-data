(module
  (func (export "name_len") (param $n i32) (result i32)
    (block $d (block $c (block $b (block $a
      (br_table $a $b $c $d (local.get $n)))
      (return (i32.const 3)))
      (return (i32.const 5)))
      (return (i32.const 4)))
    (i32.const 0)))
