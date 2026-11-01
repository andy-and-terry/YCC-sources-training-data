;; Sum of prime factors counted with multiplicity.
(defn sopfr [n]
  (loop [n n, p 2, total 0]
    (cond
      (= n 1) total
      (> (* p p) n) (+ total n)
      (zero? (mod n p)) (recur (quot n p) p (+ total p))
      :else (recur n (inc p) total))))

(println (clojure.string/join " "
           (filter #(= (sopfr %) (sopfr (inc %))) (range 2 110))))
