(module
  (memory (export "memory") 1)

  (func $uf_init (export "uf_init") (param $base i32) (param $n i32)
    (local $i i32)
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $n)))
        (i32.store (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4))) (local.get $i))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop))))

  (func $uf_find (export "uf_find") (param $base i32) (param $x i32) (result i32)
    (local $parent i32)
    (local.set $parent (i32.load (i32.add (local.get $base) (i32.mul (local.get $x) (i32.const 4)))))
    (if (result i32) (i32.eq (local.get $parent) (local.get $x))
      (then (local.get $x))
      (else (call $uf_find (local.get $base) (local.get $parent)))))

  (func $uf_union (export "uf_union") (param $base i32) (param $x i32) (param $y i32)
    (local $root_x i32)
    (local $root_y i32)
    (local.set $root_x (call $uf_find (local.get $base) (local.get $x)))
    (local.set $root_y (call $uf_find (local.get $base) (local.get $y)))
    (if (i32.ne (local.get $root_x) (local.get $root_y))
      (then (i32.store (i32.add (local.get $base) (i32.mul (local.get $root_x) (i32.const 4))) (local.get $root_y)))))
)
