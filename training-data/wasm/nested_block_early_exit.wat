(module
  ;; Find first multiple of both a and b greater than zero up to limit, else -1.
  (func $first_common_multiple (export "first_common_multiple")
        (param $a i32) (param $b i32) (param $limit i32) (result i32)
    (local $n i32)
    (local.set $n (i32.const 1))
    (block $not_found
      (loop $scan
        (br_if $not_found (i32.gt_u (local.get $n) (local.get $limit)))
        (if (i32.and
              (i32.eqz (i32.rem_u (local.get $n) (local.get $a)))
              (i32.eqz (i32.rem_u (local.get $n) (local.get $b))))
          (then (return (local.get $n))))
        (local.set $n (i32.add (local.get $n) (i32.const 1)))
        (br $scan)))
    (i32.const -1)))
