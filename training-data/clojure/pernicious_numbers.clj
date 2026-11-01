;; Pernicious numbers: the popcount is prime.
(defn prime? [n]
  (and (>= n 2)
       (not-any? #(zero? (mod n %)) (take-while #(<= (* % %) n) (iterate inc 2)))))

(println (clojure.string/join " "
           (filter #(prime? (Long/bitCount %)) (range 1 21))))
