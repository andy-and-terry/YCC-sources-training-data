(module
  (memory (export "memory") 1)

  (func $st_build (export "st_build") (param $arr_base i32) (param $tree_base i32) (param $n i32)
    (local $i i32)
    (local.set $i (i32.const 0))
    (block $copy_done
      (loop $copy
        (br_if $copy_done (i32.ge_s (local.get $i) (local.get $n)))
        (i32.store
          (i32.add (local.get $tree_base) (i32.mul (i32.add (local.get $n) (local.get $i)) (i32.const 4)))
          (i32.load (i32.add (local.get $arr_base) (i32.mul (local.get $i) (i32.const 4)))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $copy)))
    (local.set $i (i32.sub (local.get $n) (i32.const 1)))
    (block $build_done
      (loop $build
        (br_if $build_done (i32.lt_s (local.get $i) (i32.const 1)))
        (i32.store
          (i32.add (local.get $tree_base) (i32.mul (local.get $i) (i32.const 4)))
          (i32.add
            (i32.load (i32.add (local.get $tree_base) (i32.mul (i32.mul (local.get $i) (i32.const 2)) (i32.const 4))))
            (i32.load (i32.add (local.get $tree_base) (i32.mul (i32.add (i32.mul (local.get $i) (i32.const 2)) (i32.const 1)) (i32.const 4))))))
        (local.set $i (i32.sub (local.get $i) (i32.const 1)))
        (br $build))))

  (func $st_update (export "st_update") (param $tree_base i32) (param $n i32) (param $pos i32) (param $value i32)
    (local $i i32)
    (local.set $i (i32.add (local.get $pos) (local.get $n)))
    (i32.store (i32.add (local.get $tree_base) (i32.mul (local.get $i) (i32.const 4))) (local.get $value))
    (local.set $i (i32.div_s (local.get $i) (i32.const 2)))
    (block $up_done
      (loop $up
        (br_if $up_done (i32.lt_s (local.get $i) (i32.const 1)))
        (i32.store
          (i32.add (local.get $tree_base) (i32.mul (local.get $i) (i32.const 4)))
          (i32.add
            (i32.load (i32.add (local.get $tree_base) (i32.mul (i32.mul (local.get $i) (i32.const 2)) (i32.const 4))))
            (i32.load (i32.add (local.get $tree_base) (i32.mul (i32.add (i32.mul (local.get $i) (i32.const 2)) (i32.const 1)) (i32.const 4))))))
        (local.set $i (i32.div_s (local.get $i) (i32.const 2)))
        (br $up))))

  (func $st_query (export "st_query") (param $tree_base i32) (param $n i32) (param $l_in i32) (param $r_in i32) (result i32)
    (local $l i32)
    (local $r i32)
    (local $res i32)
    (local.set $l (i32.add (local.get $l_in) (local.get $n)))
    (local.set $r (i32.add (local.get $r_in) (local.get $n)))
    (local.set $res (i32.const 0))
    (block $q_done
      (loop $q
        (br_if $q_done (i32.ge_s (local.get $l) (local.get $r)))
        (if (i32.and (local.get $l) (i32.const 1))
          (then
            (local.set $res (i32.add (local.get $res) (i32.load (i32.add (local.get $tree_base) (i32.mul (local.get $l) (i32.const 4))))))
            (local.set $l (i32.add (local.get $l) (i32.const 1)))))
        (if (i32.and (local.get $r) (i32.const 1))
          (then
            (local.set $r (i32.sub (local.get $r) (i32.const 1)))
            (local.set $res (i32.add (local.get $res) (i32.load (i32.add (local.get $tree_base) (i32.mul (local.get $r) (i32.const 4))))))))
        (local.set $l (i32.div_s (local.get $l) (i32.const 2)))
        (local.set $r (i32.div_s (local.get $r) (i32.const 2)))
        (br $q)))
    (local.get $res))
)
