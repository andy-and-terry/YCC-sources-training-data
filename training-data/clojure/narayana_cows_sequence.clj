;; Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
(def cows
  (map first (iterate (fn [[a b c]] [b c (+ a c)]) [1 1 1])))

(println (clojure.string/join " " (take 15 cows)))
