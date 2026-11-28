(defn fact [n] (reduce * 1N (range 1 (inc n))))
(defn comb [n k] (/ (fact n) (* (fact k) (fact (- n k)))))
(defn lah [n k] (/ (* (comb (dec n) (dec k)) (fact n)) (fact k)))

(doseq [n (range 1 6)]
  (println (clojure.string/join " " (map #(lah n %) (range 1 (inc n))))))
