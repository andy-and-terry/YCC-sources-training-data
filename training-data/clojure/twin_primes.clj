;; Twin primes below 100; expect 8.
(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(println (count (filter #(and (prime? %) (prime? (+ % 2))) (range 2 100))))
