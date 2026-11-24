;; Aliquot sequence: replace n by the sum of its proper divisors.
(defn aliquot-sum [n]
  (reduce + (filter #(zero? (mod n %)) (range 1 (inc (quot n 2))))))

(defn aliquot [n]
  (loop [seq-vals [n]]
    (let [x (peek seq-vals)]
      (if (or (<= x 1) (>= (count seq-vals) 20))
        seq-vals
        (recur (conj seq-vals (aliquot-sum x)))))))

(println (clojure.string/join " " (aliquot 12)))
