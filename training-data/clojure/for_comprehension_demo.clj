;; `for` is a lazy list comprehension, not a loop
(println (for [x (range 1 4) y (range 1 4)] [x y]))

;; :when filters, :let binds, :while stops early
(println (for [x (range 20) :when (odd? x) :let [sq (* x x)] :while (< sq 100)] sq))

;; Pythagorean triples
(println (for [a (range 1 21) b (range a 21) c (range b 21)
               :when (= (* c c) (+ (* a a) (* b b)))]
           [a b c]))
