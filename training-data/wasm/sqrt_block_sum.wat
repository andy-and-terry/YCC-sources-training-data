(module
  (memory (export "mem") 1)
  ;; sum of i32 elements [l, r] using 4-element blocks precomputed at offset 256
  (func (export "build") (param $n i32)
    (local $i i32) (local $b i32)
    (loop $l
      (local.set $b (i32.add (i32.const 256) (i32.mul (i32.shr_u (local.get $i) (i32.const 2)) (i32.const 4))))
      (i32.store (local.get $b)
        (i32.add (i32.load (local.get $b)) (i32.load (i32.mul (local.get $i) (i32.const 4)))))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $l (i32.lt_u (local.get $i) (local.get $n)))))
  (func (export "query") (param $l i32) (param $r i32) (result i32)
    (local $s i32)
    (block $done
      (loop $loop
        (br_if $done (i32.gt_s (local.get $l) (local.get $r)))
        (if (i32.and (i32.eqz (i32.and (local.get $l) (i32.const 3)))
                     (i32.le_s (i32.add (local.get $l) (i32.const 3)) (local.get $r)))
          (then
            (local.set $s (i32.add (local.get $s)
              (i32.load (i32.add (i32.const 256) (i32.mul (i32.shr_u (local.get $l) (i32.const 2)) (i32.const 4))))))
            (local.set $l (i32.add (local.get $l) (i32.const 4))))
          (else
            (local.set $s (i32.add (local.get $s) (i32.load (i32.mul (local.get $l) (i32.const 4)))))
            (local.set $l (i32.add (local.get $l) (i32.const 1)))))
        (br $loop)))
    (local.get $s)))
