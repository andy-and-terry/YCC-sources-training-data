;; Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
(defn fact [n] (reduce * 1 (range 1 (inc n))))
(defn comb [n k] (quot (fact n) (* (fact k) (fact (- n k)))))

(let [n 5]
  (println (clojure.string/join " "
    (for [k (range 1 (inc n))]
      (quot (* (comb (dec n) (dec k)) (fact n)) (fact k))))))
