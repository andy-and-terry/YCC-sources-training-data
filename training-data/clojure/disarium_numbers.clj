;; Disarium numbers: digits raised to their 1-based positions sum to n.
(defn disarium? [n]
  (= n (reduce + (map-indexed
                  (fn [i c] (reduce * (repeat (inc i) (Character/digit ^char c 10))))
                  (str n)))))

(println (clojure.string/join " " (filter disarium? (range 1 1000))))
