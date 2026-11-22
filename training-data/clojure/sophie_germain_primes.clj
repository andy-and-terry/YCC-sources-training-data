;; Sophie Germain primes: p prime and 2p + 1 prime.
(defn prime? [n]
  (and (>= n 2)
       (not-any? #(zero? (mod n %)) (take-while #(<= (* % %) n) (iterate inc 2)))))

(println (clojure.string/join " " (filter #(and (prime? %) (prime? (inc (* 2 %)))) (range 2 100))))
