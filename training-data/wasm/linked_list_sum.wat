(module
  (memory (export "memory") 1)

  (func $linked_list_sum (export "linked_list_sum") (param $head i32) (result i32)
    (local $cur i32)
    (local $sum i32)
    (local.set $cur (local.get $head))
    (local.set $sum (i32.const 0))
    (block $done
      (loop $walk
        (br_if $done (i32.eq (local.get $cur) (i32.const -1)))
        (local.set $sum (i32.add (local.get $sum) (i32.load (local.get $cur))))
        (local.set $cur (i32.load (i32.add (local.get $cur) (i32.const 4))))
        (br $walk)))
    (local.get $sum))
)
