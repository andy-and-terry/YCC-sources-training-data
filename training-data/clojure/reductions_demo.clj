;; reductions returns every intermediate value of a reduce
(println (reductions + [1 2 3 4 5]))
(println (reductions + 100 [1 2 3]))

(def running-max (reductions max [3 1 4 1 5 9 2 6]))
(println running-max)

;; Fibonacci via reductions over a lazy infinite seq
(println (take 10 (map first (iterate (fn [[a b]] [b (+ a b)]) [0 1]))))
