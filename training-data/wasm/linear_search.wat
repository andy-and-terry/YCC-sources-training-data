(module
  (memory (export "memory") 1)

  (func $linear_search (export "linear_search") (param $base i32) (param $len i32) (param $target i32) (result i32)
    (local $i i32)
    (local.set $i (i32.const 0))
    (block $done (result i32)
      (loop $loop (result i32)
        (if (result i32) (i32.ge_s (local.get $i) (local.get $len))
          (then (i32.const -1))
          (else
            (if (i32.eq (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))) (local.get $target))
              (then (br $done (local.get $i))))
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $loop))))))
)
