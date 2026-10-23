;; Hamming numbers (5-smooth): only prime factors 2, 3 and 5
(defn strip [n p]
  (if (zero? (mod n p)) (recur (quot n p) p) n))

(defn hamming? [n]
  (= 1 (reduce strip n [2 3 5])))

(println (clojure.string/join " " (take 20 (filter hamming? (iterate inc 1)))))
