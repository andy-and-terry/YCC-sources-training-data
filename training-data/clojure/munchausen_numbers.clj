;; Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
(defn munchausen? [n]
  (= n (reduce + (map (fn [c]
                        (let [d (Character/digit ^char c 10)]
                          (if (zero? d) 0 (reduce * (repeat d d)))))
                      (str n)))))

(println (clojure.string/join " " (filter munchausen? (range 1 5000))))
