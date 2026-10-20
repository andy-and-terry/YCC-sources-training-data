(def fibs (lazy-cat [0 1] (map + fibs (rest fibs))))
(println (take 12 fibs))
(defn primes [] (letfn [(sieve [s] (lazy-seq (cons (first s) (sieve (remove #(zero? (mod % (first s))) (rest s))))))]
                  (sieve (iterate inc 2))))
(println (take 10 (primes)))
(println (take 5 (iterate #(* 2 %) 1)) (take 7 (cycle [1 2 3])) (take 3 (repeat :x)))
(println (take-while #(< % 40) (map #(* % %) (range))))
(println (realized? (map inc (range 3))))
(println (doall (map #(* 2 %) (range 4))))
