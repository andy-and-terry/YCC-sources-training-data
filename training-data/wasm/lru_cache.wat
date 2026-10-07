(module
  (memory (export "memory") 1)
  (global $clock (mut i32) (i32.const 0))

  ;; A fixed-capacity LRU cache over parallel arrays at cache_base:
  ;; keys (i32), values (i32), and last-used ticks (i32), each
  ;; capacity entries long, plus a size_base cell tracking how many
  ;; slots are filled. A key of -1 marks an empty slot.

  (func $lru_find_slot (param $cache_base i32) (param $capacity i32) (param $key i32) (result i32)
    (local $i i32)
    (local.set $i (i32.const 0))
    (block $done
      (loop $loop
        (br_if $done (i32.ge_s (local.get $i) (local.get $capacity)))
        (if (i32.eq (i32.load (i32.add (local.get $cache_base) (i32.mul (local.get $i) (i32.const 4)))) (local.get $key))
          (then (return (local.get $i))))
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br $loop)))
    (i32.const -1))

  (func $lru_get (export "lru_get") (param $cache_base i32) (param $values_base i32) (param $ticks_base i32) (param $capacity i32) (param $key i32) (result i32)
    (local $slot i32)
    (local.set $slot (call $lru_find_slot (local.get $cache_base) (local.get $capacity) (local.get $key)))
    (if (result i32) (i32.lt_s (local.get $slot) (i32.const 0))
      (then (i32.const -1))
      (else
        (global.set $clock (i32.add (global.get $clock) (i32.const 1)))
        (i32.store (i32.add (local.get $ticks_base) (i32.mul (local.get $slot) (i32.const 4))) (global.get $clock))
        (i32.load (i32.add (local.get $values_base) (i32.mul (local.get $slot) (i32.const 4)))))))

  (func $lru_put (export "lru_put") (param $cache_base i32) (param $values_base i32) (param $ticks_base i32) (param $capacity i32) (param $key i32) (param $value i32)
    (local $slot i32)
    (local $i i32)
    (local $oldest_idx i32)
    (local $oldest_tick i32)
    (global.set $clock (i32.add (global.get $clock) (i32.const 1)))
    (local.set $slot (call $lru_find_slot (local.get $cache_base) (local.get $capacity) (local.get $key)))
    (if (i32.lt_s (local.get $slot) (i32.const 0))
      (then
        (local.set $slot (call $lru_find_slot (local.get $cache_base) (local.get $capacity) (i32.const -1)))
        (if (i32.lt_s (local.get $slot) (i32.const 0))
          (then
            (local.set $oldest_idx (i32.const 0))
            (local.set $oldest_tick (i32.load (local.get $ticks_base)))
            (local.set $i (i32.const 1))
            (block $scan_done
              (loop $scan
                (br_if $scan_done (i32.ge_s (local.get $i) (local.get $capacity)))
                (if (i32.lt_s (i32.load (i32.add (local.get $ticks_base) (i32.mul (local.get $i) (i32.const 4)))) (local.get $oldest_tick))
                  (then
                    (local.set $oldest_tick (i32.load (i32.add (local.get $ticks_base) (i32.mul (local.get $i) (i32.const 4)))))
                    (local.set $oldest_idx (local.get $i))))
                (local.set $i (i32.add (local.get $i) (i32.const 1)))
                (br $scan)))
            (local.set $slot (local.get $oldest_idx))))))
    (i32.store (i32.add (local.get $cache_base) (i32.mul (local.get $slot) (i32.const 4))) (local.get $key))
    (i32.store (i32.add (local.get $values_base) (i32.mul (local.get $slot) (i32.const 4))) (local.get $value))
    (i32.store (i32.add (local.get $ticks_base) (i32.mul (local.get $slot) (i32.const 4))) (global.get $clock)))
)
