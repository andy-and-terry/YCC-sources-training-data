(module
  (memory (export "mem") 1)

  (func $max_area (export "max_area") (param $ptr i32) (param $n i32) (result i32)
    (local $lo i32) (local $hi i32) (local $best i32) (local $a i32) (local $b i32) (local $area i32)
    (local.set $hi (i32.sub (local.get $n) (i32.const 1)))
    (block $done
      (loop $step
        (br_if $done (i32.ge_s (local.get $lo) (local.get $hi)))
        (local.set $a (i32.load (i32.add (local.get $ptr) (i32.shl (local.get $lo) (i32.const 2)))))
        (local.set $b (i32.load (i32.add (local.get $ptr) (i32.shl (local.get $hi) (i32.const 2)))))
        (local.set $area
          (i32.mul
            (select (local.get $a) (local.get $b) (i32.lt_s (local.get $a) (local.get $b)))
            (i32.sub (local.get $hi) (local.get $lo))))
        (if (i32.gt_s (local.get $area) (local.get $best))
          (then (local.set $best (local.get $area))))
        (if (i32.lt_s (local.get $a) (local.get $b))
          (then (local.set $lo (i32.add (local.get $lo) (i32.const 1))))
          (else (local.set $hi (i32.sub (local.get $hi) (i32.const 1)))))
        (br $step)))
    (local.get $best))
)
