(module
  (memory (export "memory") 1)

  (func $grow_and_check (export "grow_and_check") (param $pages i32) (result i32)
    (memory.grow (local.get $pages)))

  (func $current_size (export "current_size") (result i32)
    (memory.size))
)
