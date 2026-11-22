;; Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
(defn prime? [n]
  (and (>= n 2)
       (not-any? #(zero? (mod n %)) (take-while #(<= (* % %) n) (iterate inc 2)))))

(println (clojure.string/join " " (filter #(and (prime? %) (prime? (+ % 2))) (range 2 100))))
