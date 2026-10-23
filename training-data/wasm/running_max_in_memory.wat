(module
  (memory (export "memory") 1)
  (data (i32.const 0) "\03\00\00\00\01\00\00\00\07\00\00\00\02\00\00\00\09\00\00\00\04\00\00\00")

  ;; Rewrite array of n i32 values in place as its running maximum.
  (func (export "running_max") (param $ptr i32) (param $n i32)
    (local $i i32)
    (local $max i32)
    (local $v i32)
    (local.set $max (i32.const -2147483648))
    (block $done
      (loop $step
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $v (i32.load (local.get $ptr)))
        (if (i32.gt_s (local.get $v) (local.get $max))
          (then (local.set $max (local.get $v))))
        (i32.store (local.get $ptr) (local.get $max))
        (local.set $ptr (i32.add (local.get $ptr) (i32.const 4)))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $step))))

  ;; Read element at index i.
  (func (export "get") (param $i i32) (result i32)
    (i32.load (i32.mul (local.get $i) (i32.const 4))))
)
