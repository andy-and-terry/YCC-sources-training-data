(module
  (memory (export "memory") 1)

  ;; Builds the Z-array for a string at str_base (length n) into
  ;; z_base: z[i] is the length of the longest substring starting at
  ;; i that matches a prefix of the string. Used for pattern matching
  ;; by scanning the Z-array of (pattern + separator + text).

  (func $z_build (export "z_build") (param $str_base i32) (param $n i32) (param $z_base i32)
    (local $i i32)
    (local $l i32)
    (local $r i32)
    (local $zi i32)
    (local.set $l (i32.const 0))
    (local.set $r (i32.const 0))
    (i32.store (local.get $z_base) (i32.const 0))

    (local.set $i (i32.const 1))
    (block $outer_done
      (loop $outer
        (br_if $outer_done (i32.ge_s (local.get $i) (local.get $n)))
        (local.set $zi (i32.const 0))
        (if (i32.lt_s (local.get $i) (local.get $r))
          (then
            (local.set $zi (i32.load (i32.add (local.get $z_base) (i32.mul (i32.sub (local.get $i) (local.get $l)) (i32.const 4)))))
            (if (i32.gt_s (local.get $zi) (i32.sub (local.get $r) (local.get $i)))
              (then (local.set $zi (i32.sub (local.get $r) (local.get $i)))))))

        (block $match_done
          (loop $match
            (br_if $match_done (i32.ge_s (i32.add (local.get $i) (local.get $zi)) (local.get $n)))
            (br_if $match_done
              (i32.ne
                (i32.load8_u (i32.add (local.get $str_base) (local.get $zi)))
                (i32.load8_u (i32.add (local.get $str_base) (i32.add (local.get $i) (local.get $zi))))))
            (local.set $zi (i32.add (local.get $zi) (i32.const 1)))
            (br $match)))

        (i32.store (i32.add (local.get $z_base) (i32.mul (local.get $i) (i32.const 4))) (local.get $zi))
        (if (i32.gt_s (i32.add (local.get $i) (local.get $zi)) (local.get $r))
          (then
            (local.set $l (local.get $i))
            (local.set $r (i32.add (local.get $i) (local.get $zi)))))

        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $outer))))
)
