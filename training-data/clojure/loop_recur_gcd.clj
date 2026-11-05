(defn gcd [a b]
  (loop [a a b b]
    (if (zero? b) a (recur b (mod a b)))))
(println (gcd 48 18))
(println (gcd 17 5))
