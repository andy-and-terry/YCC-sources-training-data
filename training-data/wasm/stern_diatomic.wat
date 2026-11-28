(module
  ;; Recursive definition: s(0)=0, s(1)=1, s(2n)=s(n), s(2n+1)=s(n)+s(n+1)
  (func $stern (export "stern") (param $i i32) (result i32)
    (local $h i32)
    (if (i32.le_u (local.get $i) (i32.const 1)) (then (return (local.get $i))))
    (local.set $h (i32.shr_u (local.get $i) (i32.const 1)))
    (if (result i32) (i32.and (local.get $i) (i32.const 1))
      (then
        (i32.add
          (call $stern (local.get $h))
          (call $stern (i32.add (local.get $h) (i32.const 1)))))
      (else (call $stern (local.get $h))))))
