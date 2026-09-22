(module
  (memory (export "memory") 1)

  ;; Inserts value into the min-heap stored in base[0..size), sifting it up
  ;; into place. Returns the heap's new size.
  (func $heap_push (export "heap_push") (param $base i32) (param $size i32) (param $value i32) (result i32)
    (local $i i32)
    (local $parent i32)
    (local $parent_val i32)
    (i32.store (i32.add (local.get $base) (i32.mul (local.get $size) (i32.const 4))) (local.get $value))
    (local.set $i (local.get $size))
    (block $done
      (loop $loop
        (br_if $done (i32.eq (local.get $i) (i32.const 0)))
        (local.set $parent (i32.div_s (i32.sub (local.get $i) (i32.const 1)) (i32.const 2)))
        (local.set $parent_val (i32.load (i32.add (local.get $base) (i32.mul (local.get $parent) (i32.const 4)))))
        (br_if $done (i32.le_s (local.get $parent_val) (local.get $value)))
        (i32.store (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4))) (local.get $parent_val))
        (i32.store (i32.add (local.get $base) (i32.mul (local.get $parent) (i32.const 4))) (local.get $value))
        (local.set $i (local.get $parent))
        (br $loop)))
    (i32.add (local.get $size) (i32.const 1)))

  ;; Removes and returns the minimum from the min-heap stored in base[0..size),
  ;; moving the last element to the root and sifting it down. Results are
  ;; returned in order (min_value, new_size).
  (func $heap_pop (export "heap_pop") (param $base i32) (param $size i32) (result i32 i32)
    (local $min_val i32)
    (local $last_val i32)
    (local $new_size i32)
    (local $i i32)
    (local $left i32)
    (local $right i32)
    (local $smallest i32)
    (local $left_val i32)
    (local $right_val i32)
    (local $smallest_val i32)
    (local $tmp i32)
    (local.set $min_val (i32.load (local.get $base)))
    (local.set $new_size (i32.sub (local.get $size) (i32.const 1)))
    (local.set $last_val (i32.load (i32.add (local.get $base) (i32.mul (local.get $new_size) (i32.const 4)))))
    (i32.store (local.get $base) (local.get $last_val))
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (local.set $left (i32.add (i32.mul (local.get $i) (i32.const 2)) (i32.const 1)))
        (local.set $right (i32.add (i32.mul (local.get $i) (i32.const 2)) (i32.const 2)))
        (local.set $smallest (local.get $i))
        (local.set $smallest_val (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (if (i32.lt_s (local.get $left) (local.get $new_size))
          (then
            (local.set $left_val (i32.load (i32.add (local.get $base) (i32.mul (local.get $left) (i32.const 4)))))
            (if (i32.lt_s (local.get $left_val) (local.get $smallest_val))
              (then
                (local.set $smallest (local.get $left))
                (local.set $smallest_val (local.get $left_val))))))
        (if (i32.lt_s (local.get $right) (local.get $new_size))
          (then
            (local.set $right_val (i32.load (i32.add (local.get $base) (i32.mul (local.get $right) (i32.const 4)))))
            (if (i32.lt_s (local.get $right_val) (local.get $smallest_val))
              (then
                (local.set $smallest (local.get $right))
                (local.set $smallest_val (local.get $right_val))))))
        (br_if $done (i32.eq (local.get $smallest) (local.get $i)))
        (local.set $tmp (i32.load (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))))
        (i32.store (i32.add (local.get $base) (i32.mul (local.get $i) (i32.const 4)))
          (i32.load (i32.add (local.get $base) (i32.mul (local.get $smallest) (i32.const 4)))))
        (i32.store (i32.add (local.get $base) (i32.mul (local.get $smallest) (i32.const 4))) (local.get $tmp))
        (local.set $i (local.get $smallest))
        (br $loop)))
    (local.get $min_val)
    (local.get $new_size))
)
