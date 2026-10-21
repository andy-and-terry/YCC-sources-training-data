;; Lazy sequence of Pell numbers: P(n) = 2*P(n-1) + P(n-2)
(def pell
  (map first (iterate (fn [[a b]] [b (+ (* 2 b) a)]) [0 1])))

(doseq [[i p] (map-indexed vector (take 15 pell))]
  (println (str "P(" i ") = " p)))
