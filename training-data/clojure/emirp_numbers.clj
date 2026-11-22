;; Emirps: primes whose digit reversal is a different prime.
(defn prime? [n]
  (and (>= n 2)
       (not-any? #(zero? (mod n %)) (take-while #(<= (* % %) n) (iterate inc 2)))))

(defn emirp? [n]
  (let [r (Long/parseLong (apply str (reverse (str n))))]
    (and (not= r n) (prime? n) (prime? r))))

(println (clojure.string/join " " (filter emirp? (range 2 200))))
