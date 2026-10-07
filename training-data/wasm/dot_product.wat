(module
  (memory (export "memory") 1)
  (data (i32.const 0)  "\01\00\00\00\02\00\00\00\03\00\00\00")
  (data (i32.const 16) "\04\00\00\00\05\00\00\00\06\00\00\00")

  ;; Dot product of two i32 vectors of length n at addresses a and b
  (func (export "dot") (param $a i32) (param $b i32) (param $n i32) (result i32)
    (local $i i32)
    (local $sum i32)
    (block $done
      (loop $next
        (br_if $done (i32.ge_u (local.get $i) (local.get $n)))
        (local.set $sum
          (i32.add
            (local.get $sum)
            (i32.mul
              (i32.load (i32.add (local.get $a) (i32.shl (local.get $i) (i32.const 2))))
              (i32.load (i32.add (local.get $b) (i32.shl (local.get $i) (i32.const 2)))))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $next)))
    (local.get $sum))

  ;; 1*4 + 2*5 + 3*6 = 32
  (func (export "demo") (result i32)
    (call 0 (i32.const 0) (i32.const 16) (i32.const 3)))
)
