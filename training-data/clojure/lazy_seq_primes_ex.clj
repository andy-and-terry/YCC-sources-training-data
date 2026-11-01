(defn primes []
  (letfn [(sieve [s] (lazy-seq (cons (first s) (sieve (remove #(zero? (mod % (first s))) (rest s))))))]
    (sieve (iterate inc 2))))

(println (take 10 (primes)))
