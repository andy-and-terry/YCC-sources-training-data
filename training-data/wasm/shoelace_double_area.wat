(module
  (memory (export "memory") 1)
  ;; points stored as i32 pairs (x, y); returns twice the absolute area
  (func (export "double_area") (param $ptr i32) (param $n i32) (result i32)
    (local $i i32) (local $j i32) (local $s i32) (local $a i32) (local $b i32)
    (loop $next
      (local.set $a (i32.add (local.get $ptr) (i32.shl (local.get $i) (i32.const 3))))
      (local.set $j (i32.rem_u (i32.add (local.get $i) (i32.const 1)) (local.get $n)))
      (local.set $b (i32.add (local.get $ptr) (i32.shl (local.get $j) (i32.const 3))))
      (local.set $s (i32.add (local.get $s)
        (i32.sub
          (i32.mul (i32.load (local.get $a)) (i32.load offset=4 (local.get $b)))
          (i32.mul (i32.load (local.get $b)) (i32.load offset=4 (local.get $a))))))
      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $next (i32.lt_u (local.get $i) (local.get $n))))
    (select (i32.sub (i32.const 0) (local.get $s)) (local.get $s)
            (i32.lt_s (local.get $s) (i32.const 0))))
)
