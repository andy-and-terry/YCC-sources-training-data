;; is_superperfect(n): sigma(sigma(n)) == 2n. True for 2 4 16 64 4096 ...
(module
  (func $sigma (param $n i32) (result i32)
    (local $d i32) (local $s i32)
    (local.set $d (i32.const 1))
    (block $done
      (loop $next
        (br_if $done (i32.gt_u (local.get $d) (local.get $n)))
        (if (i32.eqz (i32.rem_u (local.get $n) (local.get $d)))
          (then (local.set $s (i32.add (local.get $s) (local.get $d)))))
        (local.set $d (i32.add (local.get $d) (i32.const 1)))
        (br $next)))
    (local.get $s))

  (func (export "is_superperfect") (param $n i32) (result i32)
    (i32.eq
      (call $sigma (call $sigma (local.get $n)))
      (i32.mul (local.get $n) (i32.const 2)))))
