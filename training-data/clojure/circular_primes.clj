;; Circular primes below 100; expect 13.
(defn prime? [n]
  (and (> n 1) (not-any? #(zero? (mod n %)) (range 2 (inc (long (Math/sqrt n)))))))

(defn circular? [n]
  (let [s (str n)]
    (every? #(prime? (parse-long (str (subs s %) (subs s 0 %)))) (range (count s)))))
(println (count (filter circular? (range 2 100))))
