(module
  ;; Memory is provided by the host rather than defined here.
  (import "env" "mem" (memory 1))

  (func $store_pair (export "store_pair") (param $at i32) (param $a i32) (param $b i32)
    (i32.store (local.get $at) (local.get $a))
    (i32.store offset=4 (local.get $at) (local.get $b)))

  (func $sum_pair (export "sum_pair") (param $at i32) (result i32)
    (i32.add (i32.load (local.get $at)) (i32.load offset=4 (local.get $at)))))
