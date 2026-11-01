;; Ways to write n as a sum of two or more consecutive positive integers.
(defn polite-ways [n]
  (count
   (for [k (take-while #(<= (quot (* % (inc %)) 2) n) (iterate inc 2))
         :when (zero? (mod (- n (quot (* k (dec k)) 2)) k))]
     k)))

(println (clojure.string/join " " (map polite-ways (range 1 17))))
