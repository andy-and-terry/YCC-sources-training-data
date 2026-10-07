(defn factorize [n]
  (loop [n n divisor 2 factors []]
    (cond
      (> (* divisor divisor) n)
      (if (> n 1) (conj factors n) factors)

      (zero? (mod n divisor))
      (recur (quot n divisor) divisor (conj factors divisor))

      :else
      (recur n (inc divisor) factors))))

(println (factorize 360))
(println (factorize 97))
