(module
  (memory (export "memory") 1)

  ;; decodes $num_pairs (char, run-length) byte pairs starting at $in_base
  ;; back into an expanded byte stream at $out_base; returns the decoded
  ;; length. Pairs with this layout are produced by rle_encode.
  (func $rle_decode (export "rle_decode") (param $in_base i32) (param $num_pairs i32) (param $out_base i32) (result i32)
    (local $p i32)
    (local $c i32)
    (local $run i32)
    (local $k i32)
    (local $out_i i32)
    (local.set $p (i32.const 0))
    (local.set $out_i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $p) (local.get $num_pairs)))
        (local.set $c (i32.load8_u (i32.add (local.get $in_base) (i32.mul (local.get $p) (i32.const 2)))))
        (local.set $run (i32.load8_u (i32.add (local.get $in_base) (i32.add (i32.mul (local.get $p) (i32.const 2)) (i32.const 1)))))
        (local.set $k (i32.const 0))
        (block $fill_done
          (loop $fill
            (br_if $fill_done (i32.ge_s (local.get $k) (local.get $run)))
            (i32.store8 (i32.add (local.get $out_base) (local.get $out_i)) (local.get $c))
            (local.set $out_i (i32.add (local.get $out_i) (i32.const 1)))
            (local.set $k (i32.add (local.get $k) (i32.const 1)))
            (br $fill)))
        (local.set $p (i32.add (local.get $p) (i32.const 1)))
        (br $loop)))
    (local.get $out_i))
)
