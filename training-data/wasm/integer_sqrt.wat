(module
  (func $integer_sqrt (export "integer_sqrt") (param $n i32) (result i32)
    (local $r i32)
    (local.set $r (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done
          (i32.gt_s
            (i32.mul (i32.add (local.get $r) (i32.const 1)) (i32.add (local.get $r) (i32.const 1)))
            (local.get $n)))
        (local.set $r (i32.add (local.get $r) (i32.const 1)))
        (br $loop)))
    (local.get $r))
)
