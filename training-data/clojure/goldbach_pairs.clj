;; Goldbach partitions of 100; expect 6.
(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(let [pairs (for [p (range 2 51) :when (and (prime? p) (prime? (- 100 p)))] [p (- 100 p)])]
  (println (count pairs) pairs))
