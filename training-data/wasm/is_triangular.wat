(module
  ;; n is triangular iff 8n + 1 is a perfect square.
  (func (export "is_triangular") (param $n i32) (result i32)
    (local $s i32)
    (local $r i32)
    (local.set $s (i32.add (i32.mul (local.get $n) (i32.const 8)) (i32.const 1)))
    (block $done
      (loop $grow
        (br_if $done
          (i32.gt_u
            (i32.mul (i32.add (local.get $r) (i32.const 1)) (i32.add (local.get $r) (i32.const 1)))
            (local.get $s)))
        (local.set $r (i32.add (local.get $r) (i32.const 1)))
        (br $grow)))
    (i32.eq (i32.mul (local.get $r) (local.get $r)) (local.get $s))))
