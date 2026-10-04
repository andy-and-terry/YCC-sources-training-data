(println (for [x (range 1 4) y (range 1 4)] [x y]))

(println (for [x (range 1 4) y (range 1 4) :when (< x y)] [x y]))

(println (for [x (range 10) :when (odd? x) :let [sq (* x x)]] sq))

(println (for [x (range 1 20)
               :while (< x 8)
               :when (even? x)]
           x))

(println (for [c "abc" n [1 2]] (str c n)))
