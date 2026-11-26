;; Primorials up to 1e6, including 1; expect 8.
(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(let [primes (filter prime? (iterate inc 2))
      values (take-while #(<= % 1000000) (reductions * 1 primes))]
  (println (count values) values))
