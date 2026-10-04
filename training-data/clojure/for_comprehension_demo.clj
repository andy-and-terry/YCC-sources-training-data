(println (for [x (range 1 4) y (range 1 4) :when (< x y)] [x y]))
(println (for [x (range 10) :let [sq (* x x)] :when (even? sq)] sq))
(println (for [x [1 2 3] :while (< x 3)] (* 10 x)))
(println (for [suit [:h :s] rank [1 2]] (str (name suit) rank)))
