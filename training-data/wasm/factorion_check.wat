(module
  (memory 1)
  (data (i32.const 0) "\01\00\00\00\01\00\00\00\02\00\00\00\06\00\00\00\18\00\00\00\78\00\00\00\d0\02\00\00\90\13\00\00\80\9d\00\00\80\75\05\00")
  (func (export "is_factorion") (param $n i32) (result i32)
    (local $m i32) (local $sum i32)
    (local.set $m (local.get $n))
    (block $done
      (loop $next
        (br_if $done (i32.eqz (local.get $m)))
        (local.set $sum
          (i32.add (local.get $sum)
            (i32.load (i32.shl (i32.rem_u (local.get $m) (i32.const 10)) (i32.const 2)))))
        (local.set $m (i32.div_u (local.get $m) (i32.const 10)))
        (br $next)))
    (i32.eq (local.get $sum) (local.get $n)))
)
