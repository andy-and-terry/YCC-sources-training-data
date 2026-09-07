(module
  (memory (export "memory") 1)

  (func $rle_encode (export "rle_encode") (param $in_base i32) (param $len i32) (param $out_base i32) (result i32)
    (local $i i32)
    (local $out_i i32)
    (local $run i32)
    (local $c i32)
    (local.set $i (i32.const 0))
    (local.set $out_i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $len)))
        (local.set $c (i32.load8_u (i32.add (local.get $in_base) (local.get $i))))
        (local.set $run (i32.const 1))
        (block $count_done
          (loop $count_loop
            (br_if $count_done (i32.ge_s (i32.add (local.get $i) (local.get $run)) (local.get $len)))
            (br_if $count_done (i32.ne (i32.load8_u (i32.add (local.get $in_base) (i32.add (local.get $i) (local.get $run)))) (local.get $c)))
            (local.set $run (i32.add (local.get $run) (i32.const 1)))
            (br $count_loop)))
        (i32.store8 (i32.add (local.get $out_base) (local.get $out_i)) (local.get $c))
        (i32.store8 (i32.add (local.get $out_base) (i32.add (local.get $out_i) (i32.const 1))) (local.get $run))
        (local.set $out_i (i32.add (local.get $out_i) (i32.const 2)))
        (local.set $i (i32.add (local.get $i) (local.get $run)))
        (br $loop)))
    (local.get $out_i))
)
