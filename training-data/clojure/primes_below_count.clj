(defn count-primes-below [n]
  (if (< n 3)
    0
    (loop [candidates (range 2 n) cnt 0]
      (if-let [p (first candidates)]
        (recur (remove #(zero? (mod % p)) (rest candidates)) (inc cnt))
        cnt))))

(println (count-primes-below 100))
