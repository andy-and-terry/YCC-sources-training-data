(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(def primes (filter prime? (iterate inc 2)))

(println (take 15 primes))
(println (nth primes 99))
