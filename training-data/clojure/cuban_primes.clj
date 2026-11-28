(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(def cuban-primes
  (->> (iterate inc 1)
       (map #(+ (* 3 % %) (* 3 %) 1))
       (filter prime?)))

(println (take 8 cuban-primes))
