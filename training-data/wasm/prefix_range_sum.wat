(module
  (memory 1)
  ;; Builds prefix sums for n i32 values at offset 0, writing them at offset 1024.
  (func $build (export "build") (param $n i32)
    (local $i i32) (local $acc i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $acc
          (i32.add (local.get $acc)
                   (i32.load (i32.mul (local.get $i) (i32.const 4)))))
        (i32.store
          (i32.add (i32.const 1024) (i32.mul (i32.add (local.get $i) (i32.const 1)) (i32.const 4)))
          (local.get $acc))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next))))
  (func $query (export "query") (param $lo i32) (param $hi i32) (result i32)
    (i32.sub
      (i32.load (i32.add (i32.const 1024) (i32.mul (local.get $hi) (i32.const 4))))
      (i32.load (i32.add (i32.const 1024) (i32.mul (local.get $lo) (i32.const 4)))))))
