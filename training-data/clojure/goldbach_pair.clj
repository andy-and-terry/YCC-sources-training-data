;; Goldbach pair.
(defn prime? [n] (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (int (Math/sqrt n)))))))
(defn goldbach [n] (first (for [p (range 2 (inc (quot n 2))) :when (and (prime? p) (prime? (- n p)))] [p (- n p)])))
(println (goldbach 28))
