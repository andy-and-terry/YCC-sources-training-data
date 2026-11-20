;; Aliquot sum classification.
(defn aliquot [n] (reduce + (filter #(zero? (mod n %)) (range 1 n))))
(doseq [n [6 12 15 28]]
  (let [a (aliquot n)]
    (println n a (cond (= a n) "perfect" (> a n) "abundant" :else "deficient"))))
