(module
  ;; Linear interpolation: a + (b - a) * t
  (func $lerp (export "lerp") (param $a f32) (param $b f32) (param $t f32) (result f32)
    (f32.add
      (local.get $a)
      (f32.mul
        (f32.sub (local.get $b) (local.get $a))
        (local.get $t))))
)
