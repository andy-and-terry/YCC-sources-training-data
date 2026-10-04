;; nested iteration: the rightmost binding varies fastest
(println (for [x [1 2 3] y [:a :b]] [x y]))

;; :when filters
(println (for [x (range 20) :when (zero? (mod x 3))] x))

;; :let introduces intermediate values
(println (for [x (range 1 6) :let [sq (* x x)] :when (odd? sq)] [x sq]))

;; :while stops the inner iteration early
(println (for [x (range 3) y (range 10) :while (< y x)] [x y]))

;; pythagorean triples
(println (for [a (range 1 21)
               b (range a 21)
               c (range b 21)
               :when (= (* c c) (+ (* a a) (* b b)))]
           [a b c]))

;; for is lazy; doseq is for side effects
(def lazy-squares (for [n (range)] (* n n)))
(println (take 5 lazy-squares))
(doseq [row (range 3)]
  (println (apply str (for [col (range 5)] (if (= row col) "#" ".")))))
