(module
  (memory (export "memory") 1)
  (global $sp (mut i32) (i32.const 0))

  (func $push (export "push") (param $stack_base i32) (param $value i32)
    (i32.store (i32.add (local.get $stack_base) (i32.mul (global.get $sp) (i32.const 4))) (local.get $value))
    (global.set $sp (i32.add (global.get $sp) (i32.const 1))))

  (func $pop (export "pop") (param $stack_base i32) (result i32)
    (global.set $sp (i32.sub (global.get $sp) (i32.const 1)))
    (i32.load (i32.add (local.get $stack_base) (i32.mul (global.get $sp) (i32.const 4)))))
)
