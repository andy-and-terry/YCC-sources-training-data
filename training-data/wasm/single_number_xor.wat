(module
  (memory (export "mem") 1)

  ;; Every value appears twice except one; XOR of the whole array is that value.
  (func $single (export "single") (param $ptr i32) (param $n i32) (result i32)
    (local $i i32) (local $acc i32)
    (block $done
      (loop $step
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $acc
          (i32.xor (local.get $acc)
            (i32.load (i32.add (local.get $ptr) (i32.shl (local.get $i) (i32.const 2))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $step)))
    (local.get $acc))
)
