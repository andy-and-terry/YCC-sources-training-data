;; Squarefree numbers up to 100; expect 61.
(defn squarefree? [n]
  (every? #(pos? (mod n (* % %))) (range 2 (inc (long (Math/sqrt n))))))
(println (count (filter squarefree? (range 1 101))))
