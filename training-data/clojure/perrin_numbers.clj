;; Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
(def perrin
  (map first (iterate (fn [[a b c]] [b c (+ a b)]) [3 0 2])))

(println (clojure.string/join " " (take 15 perrin)))
