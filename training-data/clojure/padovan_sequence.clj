;; Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
(def padovan
  (map first (iterate (fn [[a b c]] [b c (+ a b)]) [1 1 1])))

(println (take 15 padovan))
