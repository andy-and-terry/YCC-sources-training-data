(defn sieve [s]
  (lazy-seq
    (let [p (first s)]
      (cons p (sieve (remove #(zero? (mod % p)) (rest s)))))))

(def primes (sieve (iterate inc 2)))

(println (take 10 primes))
(println (nth primes 20))
